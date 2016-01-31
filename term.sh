#!/bin/bash
# Copyright (c) 2015 Habib Rehman (https://git.io/HR)
# Under MIT license
# Script for OSX for opening a new terminal at
# the current directory, a specified directory or specified directories

term () {
	if [ $# -ge 2 ]						# If more than two dirs passed
		then						# open each dir
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
			if [ "-r" -eq "$1" ]
				then
					source ~/.bash_profile
				else
					open -a Terminal "$1"
			fi
	fi
	return 0
}
