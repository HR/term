# term
Script for OSX for opening a new terminal at the current directory, a specified directory or specified directories and doing some useful stuff.

This may become a brew recipe at some point in the future.

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
$ term
```

To open a specific directory
```shell
$ term [path to dir]
```

To open a multiple specific directories
```shell
$ term [dir1 path] [dir2 path] [dir3 path] ... [dirN path]
```
These will all open in separate new Terminals.

To source ~/.bash_profile
```shell
$ term -s
```

To source a specified script
```shell
$ term -s=[script]
```

To execute a specified command in a new Terminal at current directory.
```shell
$ term -e=[command]
```

To get some help
```shell
$ term -h
> term [-h | --help] [-s script | --source script] [-e command | --exec command] [dir...] -- a Terminal helper utility
> With no arguments specified, a new Terminal is opened at the current directory.
> If multiple directories are specified then it opens each in a new Terminal window.
> where:
>	 -h	show this help text
>	 -s	source ~/.bash_profile
>	 -s=[script] source [script]
>	 -e=[command] execute [command] in new window at current directory
```
# Contributing
Feel free to suggest any features and send in pull requests.
