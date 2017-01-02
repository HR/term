# term
The term is a Terminal helper utility that provides some very useful
functionality. It can execute a command in a new Terminal window at the current
directory or a specified directory. With no arguments specified, it opens a new
Terminal window at the current directory. If multiple directories are specified
then it opens each in a new Terminal window.

This may become a brew recipe at some point in the future.

# Installation
First clone the repo
```shell
$ git clone https://github.com/HR/term.git
```
Then set up a symlink of 'term' for the script by either sourcing it in your .bash_profile
```shell
$ echo "source ~/GitHub/term/term.sh" >> ~/.bash_profile
```
or if you use zsh
```shell
$ echo "source ~/GitHub/term/term.sh" >> ~/.zshrc
```
or add it to /usr/bin
```shell
$ mv ~/GitHub/term/term.sh /usr/bin
$ source ~/.bash_profile 							# to start using term immediately
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
$ term -s [script]
```

To execute a specified command in a new Terminal at current directory.
```shell
$ term -e [command]
```
To get some help
```shell
$ term -h
> term v1.0.0 -- a Terminal helper utility
>
> usage:
>      term [-h | --help] [-s script | --source script] [-e command | --exec command] [dir...]
>
> description:
>      The term utility provides some very useful functionality. It can execute a
>      command in a new Terminal window at the current directory or a specified
>      directory. With no arguments specified, it opens a new Terminal window at the
>      current directory. If multiple directories are specified then it opens each in a
>      new Terminal window.
>
> options:
>      -h  show this help text
>      -v  show installed version
>      -r  open the term GitHub repo to report issue, star, provide feedback...
>      -s  source ~/.bash_profile or ~/.zshrc (auto detected)
>      -s  [script] source [script]
>      -e  [command] execute [command] in new window at current directory
>      -e  [command] [dir] execute [command] in new window at [dir] directory
>
> examples:
>
>      term
>
>   will open a new Terminal window at current directory
>
>      term ~/Documents
>
>   will open a new Terminal window at ~/Documents directory
>
>      term ~/Documents ~/Pictures ~/Downloads/
>
>   will open new Terminal windows at ~/Documents ~/Pictures ~/Downloads/ directories
>
>      term -e echo hi
>
>   will open a new Terminal window at current directory and execute "echo hi"
>
>      term ~/Desktop -e "echo hi && echo bye"
>
>   will open a new Terminal window at ~/Desktop directory and execute "echo hi" followed by "echo hi"
```

# Examples
Some examples of using term

```shell
$ term
```
This will open a new Terminal window at current directory

```shell
$ term ~/Documents
```
This will open a new Terminal window at ~/Documents directory

```shell
$ term ~/Documents ~/Pictures ~/Downloads/
```
This will open new Terminal windows at ~/Documents ~/Pictures ~/Downloads/ directories

```shell
$ term -e echo hi
```
This will open a new Terminal window at current directory and execute "echo hi"

```shell
$ term ~/Desktop -e "echo hi && echo bye"
```
This will open a new Terminal window at ~/Desktop directory and execute "echo hi" followed by "echo hi"


# Contributing
Feel free to suggest any features and send in pull requests :)

# License
The MIT License (MIT)

Copyright (c) Habib Rehman (https://git.io/HR)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished todo so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
