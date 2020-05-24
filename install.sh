#!/bin/bash

road="$(pwd)"

	if grep -sq "source $road/.aliases" ~/.bashrc
	then
		:

	else
		echo  "source $road/.aliases" >> ~/.bashrc

fi

if grep -sq "source $road/./fancy_functions.sh" ~/.bashrc
	then
		:

	else
		echo  "source $road/./fancy_functions.sh" >> ~/.bashrc

fi

cd 
rep="bin"
cd $road

if [[ -d "$rep" ]]
then
	if [[ -d "/fancy_tools/bin" ]]
	then
		if [[ -e "updateFancyTools" ]]
		then
			:
			
		fi
	fi

else
	mkdir ~/bin
	cp ~/fancy_tools/bin/updateFancyTools ~/bin/updateFancyTools
fi

cd ~/fancy_tools/bin


if grep -sq "export PATH=$PATH:$road" ~/.bashrc
then
	:
else
	echo "export PATH=$PATH:$road" >> ~/.bashrc

fi


branch ()
{
	where="$(git rev-parse --abbrev-ref HEAD)"

	if [[ "$where" == "master" ]]
	then
		:
	else
		git checkout master
	fi

}

branch

cd
dos="src"
if [[ -d "$dos" ]]
then

	cp -r fancy_tools ~/src/fancy_tools

else
	mkdir ~/src
	cp -r fancy_tools ~/src/fancy_tools
fi