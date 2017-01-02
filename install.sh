#!/usr/bin/env bash
# Copyright (c) 2016 Habib Rehman (https://git.io/HR)
# Under MIT license
# term installation file

{ # this ensures the entire script is downloaded #

  # From NVM install.sh
  detect_profile() {
    if [ -n "${PROFILE}" ] && [ -f "${PROFILE}" ]; then
      echo "${PROFILE}"
      return
    fi

    local DETECTED_PROFILE
    DETECTED_PROFILE=''
    local SHELLTYPE
    SHELLTYPE="$(basename "/$SHELL")"

    if [ "$SHELLTYPE" = "bash" ]; then
      if [ -f "$HOME/.bashrc" ]; then
        DETECTED_PROFILE="$HOME/.bashrc"
        elif [ -f "$HOME/.bash_profile" ]; then
        DETECTED_PROFILE="$HOME/.bash_profile"
      fi
      elif [ "$SHELLTYPE" = "zsh" ]; then
      DETECTED_PROFILE="$HOME/.zshrc"
    fi

    if [ -z "$DETECTED_PROFILE" ]; then
      if [ -f "$HOME/.profile" ]; then
        DETECTED_PROFILE="$HOME/.profile"
        elif [ -f "$HOME/.bashrc" ]; then
        DETECTED_PROFILE="$HOME/.bashrc"
        elif [ -f "$HOME/.bash_profile" ]; then
        DETECTED_PROFILE="$HOME/.bash_profile"
        elif [ -f "$HOME/.zshrc" ]; then
        DETECTED_PROFILE="$HOME/.zshrc"
      fi
    fi

    if [ ! -z "$DETECTED_PROFILE" ]; then
      echo "$DETECTED_PROFILE"
    fi
  }

  install_term_release () {
    local VERSION
    local RELEASE
    local RELEASE_URL
    local PROFILE
    VERSION=1.0
    RELEASE="v$VERSION.zip"
    RELEASE_URL="https://github.com/HR/term/archive/$RELEASE"
    PROFILE="$(detect_profile)"

    echo "Fetching term v$VERSION from $RELEASE_URL"

    # Make temporary dir
    mkdir /tmp/term
    cd /tmp/term
    # Fetch latest release
    curl -O $RELEASE_URL
    # Unzip
    unzip $RELEASE
    # Move term to home directory
    mv term.sh $HOME

    # Make term command globally available
    echo "source $HOME/term.sh" >> $PROFILE
    # Source default zsh rc
    source $PROFILE > /dev/null

    # delete tmp files
    cd ..
    rm -r term
  }

  install_term () {
    local RELEASE
    local PROFILE
    local INSTALL_PATH
    local SOURCE_CMD
    RELEASE="https://raw.githubusercontent.com/HR/term/master/term.sh"
    PROFILE="$(detect_profile)"
    INSTALL_PATH="$HOME/.term"
    SCRIPT_PATH="$INSTALL_PATH/term.sh"
    SOURCE_CMD="source $SCRIPT_PATH > /dev/null"

    echo ""
    echo ""
    echo "Fetching term from $RELEASE"
    echo ""

    # Move term to home directory
    mkdir $INSTALL_PATH
    cd $INSTALL_PATH
    # Fetch latest release
    curl -O $RELEASE

    echo ""
    echo "Detected profile $PROFILE. Adding to it and sourcing..."
    echo ""
    # Make term command globally available
    echo $SOURCE_CMD >> $PROFILE
    # Source term.sh so it is immediately available
    \. $SCRIPT_PATH

    echo ""
    echo "Done! Successfully installed term ✅"
  }


  # Install term
  install_term

} # this ensures the entire script is downloaded #