#!/bin/bash

# Move on directory of this script
DIR=$(dirname $0)
cd $DIR

# Ask if your user is in the right folder to install yhis wworkspace ?

echo ""
echo "____________________________________________________"
echo "===================================================="
echo ""
echo ""
echo "         ____   ____    __    ____  ___      "
echo "        |___ \  \   \  /  \  /   / /   \     "
echo "          __) |  \   \/    \/   / /  ^  \    "
echo "         |__ <    \            / /  /_\  \   "
echo "         ___) |    \    /\    / /  _____  \  "
echo "        |____/      \__/  \__/ /__/     \__\ "
echo ""
echo ""
echo "____________________________________________________"
echo "===================================================="
echo ""
echo ""
unset input
printf "###  Are you in your workspace folder? [y/n] "
read input
echo ""
if [[ $input != y && $input != Y ]]; then 
	echo "Change your current folder to install your environment like cd  ~/Workspace"
	unset input
	exit 0
fi

echo ""
unset input
echo "###  Do you want to install? "
echo "##   1 - brew"
echo "##   2 - Kitura"
printf "##   >   "
read input
echo ""
echo ""

# Install brew
if [[ $input == 1 ]]; then 
	
	# Install in brew in your workspace
	echo "###  You install brew"
	echo ""
	mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew

	# Add to your env the brew folder in your PATH
	echo "Add custom path in your variable of environments \$PATH"
	printf "\nexport PATH=$HOME/homebrew/bin:/usr/local/bin:/usr/local/sbin:\$PATH" > $HOME/.bash_profile
	printf "\nexport HOMEBREW_CASK_OPTS=\"--appdir=/Applications --caskroom=/Applications/Caskroom\"\n" >> $HOME/.bash_profile
	source $HOME/.bash_profile
	echo ""
	echo ""

	# Init the xcode env
	mkdir xcode

	echo "###  Need to reboot your device or launch "
	echo "##   > source $HOME/.bash_profile"

# Install Kitura
elif [[ $input == 2 ]]; then 

	# Install Kitura on your env
	# Works to Kitura v2.
	echo "###  You install Kitura "
	#./homebrew/bin/brew tap ibm-swift/kitura
	brew tap ibm-swift/kitura
	wait
	#./homebrew/bin/brew install kitura
	brew install kitura
	wait
	mkdir -p xcode/front
	mkdir -p xcode/back

	# Init Kitura Hello Word !!
	cd xcode/back

#	mkdir HelloKitura
#	cd HelloKitura
#	kitura init
#	open HelloKitura.xcodeproj
	echo ""
	echo ""
	echo "###  Need to reboot your device or launch "
	echo "##   > source $HOME/.bash_profile"
	echo ""
	echo "###  To test Kitura execute the next lines "
	echo "##   > mkdir HelloKitura && cd HelloKitura && kitura init && open HelloKitura.xcodeproj"
	echo ""
	echo ""

else
	echo "I don't understand your chose..."
	echo ""
	echo "###  :("
	echo ""
fi

unset input
exit 0
