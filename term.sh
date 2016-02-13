#!/bin/bash
# Copyright (c) 2015 Habib Rehman (https://git.io/HR)
# Under MIT license
# Script for OSX for opening a new terminal at
# the current directory, a specified directory or specified directories

term () {
	if [ $# -ge 2 ]						# If more than two dirs passed
		then										# open each dir
			for dir in "$@"
			do
				open -a Terminal "$dir"
			done
		return 0
	fi

	if [ -z "$1" ]						# If no dirs passed then open
		then						# new term ot current dir
			open -a Terminal .
		else
			case $1 in
					-s|--source)
					source ~/.bash_profile
					return 0
					;;
					-s=*|--source=*)
					source "${1#*=}";
					return 0
					;;
					-h|--help)
					echo "term [-h | --help] [-s script | --source script] [dir...] -- OSX Terminal helper utility"
					echo "With no arguments specified, a new Terminal is opened at the current directory."
					echo "If multiple directories are specified then it opens each in a new Terminal window."
					echo "where:"
					echo "	-h	show this help text"
					echo "	-s	source ~/.bash_profile"
					echo " 	-s=[script] source [script]"
					return 0
					;;

					*)
						open -a Terminal "$1"
					;;
			esac
	fi
	return 0
}

export -f term
