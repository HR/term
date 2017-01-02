#!/bin/bash
# Copyright (c) 2016 Habib Rehman (https://git.io/HR)
# Under MIT license
# A (macOS) Terminal helper utility

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

term () {
  local PROFILE
  local VERSION
  VERSION=1.0
  PROFILE="$(detect_profile)"

  # If no args passed
  if [ -z "$1" ]
  then
    # new term at current dir
    open -a Terminal .
    return 0
  fi

  # If single arg passed
  if [ $# == 1 ]
  then
    case $1 in
      -s|--source)
        # Source the detected profile
        source $PROFILE > /dev/null
        return 0
      ;;
      -r|--repo)
        # Open git repo URL
        open "https://github.com/HR/term"
        return 0
      ;;
      -v|--version)
        # Check if running zsh
        echo "\nterm v$VERSION"
        echo "https://git.io/term\n"
        echo "Copyright (c) Habib Rehman (https://git.io/HR)"
        echo "Provided under the MIT License (MIT)"
        return 0
      ;;
      -h|--help)
        echo ""
        echo "term v$VERSION -- a Terminal helper utility\n"
        echo "usage:"
        echo "     term [-h | --help] [-s script | --source script] [-e command | --exec command] [dir...]\n"
        echo "description:"
        echo "     The term utility provides some very useful functionality. It can execute a
     command in a new Terminal window at the current directory or a specified
     directory. With no arguments specified, it opens a new Terminal window at the
     current directory. If multiple directories are specified then it opens each in a
     new Terminal window.\n"
        echo "options:"
        echo "     -h  show this help text"
        echo "     -v  show installed version"
        echo "     -r  open the term GitHub repo to report issue, star, provide feedback..."
        echo "     -s  source ~/.bash_profile or ~/.zshrc (auto detected)"
        echo "     -s  [script] source [script]"
        echo "     -e  [command] execute [command] in new window at current directory"
        echo "     -e  [command] [dir] execute [command] in new window at [dir] directory\n"
        echo "examples:\n"
        echo "     term\n"
        echo "  will open a new Terminal window at current directory\n"
        echo "     term ~/Documents\n"
        echo "  will open a new Terminal window at ~/Documents directory\n"
        echo "     term ~/Documents ~/Pictures ~/Downloads/\n"
        echo "  will open new Terminal windows at ~/Documents ~/Pictures ~/Downloads/ directories\n"
        echo "     term -e echo hi\n"
        echo "  will open a new Terminal window at current directory and execute \"echo hi\"\n"
        echo "     term ~/Desktop -e \"echo hi && echo bye\"\n"
        echo "  will open a new Terminal window at ~/Desktop directory and execute \"echo hi\" followed by \"echo hi\"\n"
        echo "For more please see https://git.io/term\n"
        return 0
      ;;
      *)
        # final fall back; just open the dirs
        open -a Terminal "$1"
        return 0
      ;;
    esac
  fi

  # If two or more args passed
  if [ $# -ge 2 ]
  then
    case $1 in
      -s*|--source*)
        source "${@:2}";
        return 0
      ;;
      -e*|--exec*)
        # Execute the passed in command in new window at current dir
        cmd="cd $(pwd) && ${@:2}" # Command is from arg 2 onwards
        osascript -e 'tell application "Terminal" to do script with command "'"${cmd}"'"';
        return 0
      ;;

      *)
        # now check second arg
        case $2 in
          -e*|--exec*)
            # Execute the passed in command in new window at the passed in dir
            cmd="cd $1 && ${@:3}"
            osascript -e 'tell application "Terminal" to do script with command "'"${cmd}"'"';
            return 0
          ;;

          *)
            # final fall back; just open the dirs
            for dir in "$@"
            do
              open -a Terminal "$dir"
            done
            return 0
          ;;
        esac
      ;;
    esac
  fi
}

export -f term
