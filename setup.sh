#!/bin/bash

# Check if ruby is available
declare -a required_commands=('ruby')

for i in $required_commands; do
	command -v $i >/dev/null 2>&1 || { echo >&2 "$i is required."; exit 1; }
done

# Check for and install command line tools
if [[ ! $(pkgutil --pkg-info=com.apple.pkg.CLTools_Executables) =~ 'package-id' ]]; then
	xcode-select --install
fi

# install homebrew
if ! command -v "brew" > /dev/null; then
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# install a bunch of brew stuff
brew install git libmagic imagemagick ruby redis mysql node python tig

# install global python plugins
if command -v "pip" > /dev/null; then
	pip install -r virtualenv virtualenvwrapper flake8 cssmin
else
	echo "npm is required.";
fi

# install global node packages
if command -v "npm" > /dev/null; then
	npm update
	npm install -g grunt-cli less uglify-js
else
	 echo "npm is required.";
fi
