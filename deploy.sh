#!/bin/bash


# Pull new updates
# This directory shuold NEVER be edited manually

git pull origin master || exit 1

# Do the build

# The nobuild file serves as a hack 
# Development of the site should always be a separate branch
# Putting a nobuild file in master exists as a last resort
# It is advised to not have to have recourse to it
# Doing so should be seen as an indication that something seriously wrong has happened to the site code
if [[ ! -f nobuild ]]; then
	nikola build || exit 2
	cp -r output/* /var/www/html/
fi
