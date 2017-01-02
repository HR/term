#!/bin/bash
# Copyright (c) 2016 Habib Rehman (https://git.io/HR)
# Under MIT license
# term installation file

TERM_VERSION=1.0
TERM_RELEASE="v$TERM_VERSION.zip"

# Make temporary dir
mkdir /tmp/term
cd /tmp/term
# Fetch latest release
curl -O "https://github.com/HR/term/archive/$TERM_RELEASE"
# Unzip
unzip $TERM_RELEASE
# Move term to home directory
mv term.sh $HOME
# Check if using zsh
if [ -n "$ZSH_VERSION" ]
then
  # Make term command globally available
  echo "source $HOME/term.sh" >> $HOME/.zshrc
  # Source default zsh rc
  source $HOME/.zshrc > /dev/null
else
  # Make term command globally available
  echo "source $HOME/term.sh" >> $HOME/.bash_profile
  # Otherwise source bash profile
  source $HOME/.bash_profile > /dev/null
fi

# delete tmp files
cd ..
rm -r term