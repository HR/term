# term
Script for OSX for opening a new terminal at the current directory, a specified directory or specified directories.

This maybe become a brew recipe at some point in the future.

# Installation
Once you have cloned the repo, you can set up a symlink of 'term' for the script by either sourcing it in your .bash_profile
```shell
echo "source ~/GitHub/term/term.sh" >> ~/.bash_profile
```
or add it to /usr/bin
```shell
mv ~/GitHub/term/term.sh /usr/bin
source ~/.bash_profile 							# to start using immediately
```

# Usage
To open a new shell at the current path
```shell
term
```

To open a specific directory
```shell
term [path to dir]
```
To open a multiple specific directories
```shell
term [dir1 path] [dir2 path] [dir3 path] ... [dirN path]
```
These will all open in separate new windows.

# Contributing
Feel free to suggest any features and send in pull requests.
