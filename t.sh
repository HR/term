#!/bin/bash
# Copyright (c) 2015 Habib Rehman (https://git.io/HR)
# Under MIT license
# Script for OSX for opening a new terminal at
# the current directory, a specified directory or specified directories


	for i in "$@"
	do
		case $i in
				-s|--source)
				source ~/.bash_profile
				exit 0
				;;
				-s=*|--source=*)
				source "${i#*=}";
				exit 0
				;;
				-h|--help)
				echo "term [-h] [-s script] [dir...] -- OSX Terminal helper utility\n"
				echo "With no arguments specified, a new Terminal is opened at the current directory."
				echo "If multiple directories are specified then it opens each in a new Terminal window."
				echo "where:"
				echo "	-h	show this help text"
				echo "	-s	source ~/.bash_profile"
				echo " 	-s=[script] source [script]"
				exit 0
				;;

				*)
					open -a Terminal "$i"
				;;
		esac
	done
