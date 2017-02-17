#!/bin/bash
# Specify colors utilized in the terminal
normal='tput sgr0'              # Normal
txtund=$(tput sgr 0 1)          # Underline
txtbld=$(tput bold)             # Bold
red='tput setaf 1'              # Red
green='tput setaf 2'            # Green
yellow='tput setaf 3'           # Yellow
orange='tput setaf 166'         # Orange
blue='tput setaf 4'             # Blue
violet='tput setaf 5'           # Violet
cyan='tput setaf 6'             # Cyan
white='tput setaf 7'            # White
txtbld=$(tput bold)             # Bold
bldred=${txtbld}$(tput setaf 1) # Bold Red
bldnormal=${txtbld}$(tput sgr0) # Bold normal
bldgrn=${txtbld}$(tput setaf 2) # Bold Green
bldblu=${txtbld}$(tput setaf 4) # Bold Blue
bldylw=$(txtbld)$(tput setaf 3) # Bold Yellow
bldorange=$(txtbld)$(tput setaf 166) # Bold Orange
bldvlt=${txtbld}$(tput setaf 5) # Bold Violet
bldcya=${txtbld}$(tput setaf 6) # Bold Cyan
bldwht=${txtbld}$(tput setaf 7) # Bold White

clear

        echo -e "${bldred}                                 "
        echo -e "${bldred}   ----------------------------- "
        echo -e "${bldred}   |    ${bldnormal}Auto-installation of LineageOS     ${bldred}| "
        echo -e "${bldred}   |                           | "
        echo -e "${bldred}   | ${bldnormal}Downloading source code ${bldred}| "
        echo -e "${bldred}   |                           | "
        echo -e "${bldred}   |   ${bldnormal}Setting up your computer  ${bldred}| "
        echo -e "${bldred}   ----------------------------  "

tput setaf 2
	if [ -d ~/android/system/ ]
	then
		read -r -p "${bldred}Directory ~/android/system/ already exists! Do you want to delete it? [Y/n]" response
		case $response in
        	[yY][eE][sS]|[yY]) 
        	sudo rm ~/android/system/ -R
        	;;
    		*)
		echo "Installer is being closed..."
        	exit
        	;;
		esac
	fi
	mkdir -p ~/android/system/
	cd ~/android/system
	
  # Initial git config
	echo "Enter your email address of Github: "
	read input_email
	echo "Enter a user of your commits on Github: "
	read input_user
	git config --global user.email "$input_email"
	git config --global user.name "$input_user"
	
clear

  # CM version selection
  echo "============================================================"
  echo " Elige tu versión de CM"
  echo "============================================================"
  echo 
  echo "  1 - CyanogenMod 12.0"
  echo "  2 - CyanogenMod 12.1"
  echo "  3 - CyanogenMod 13.0"
  echo "  4 - CyanogenMod 14.0"
  echo "  5 - LineageOS 14.1"
  echo
  echo -n "Enter an option: "
  read opt

  if [ "$?" != "1" ]
  then
    case $opt in
      1) repo init -u git://github.com/lineageos/android.git -b cm-12.0;;
      2) repo init -u git://github.com/lineageos/android.git -b cm-12.1;;
      3) repo init -u git://github.com/lineageos/android.git -b cm-13.0;;
      4) repo init -u git://github.com/lineageos/android.git -b cm-14.0;;
      5) repo init -u git://github.com/lineageos/android.git -b cm-14.1;;
    esac
  fi

  # First sync
	time repo sync --force-broken --force-sync -j4
	echo  
	echo -e "${bldcya}LineageOS source was downloaded in ~/android/system"
	echo -e "${bldcya}You can compile Lineage in the location ~/android/system"
	echo -e "${bldcya}Remember to do ${bldgrn}ccache -M 40 ${bldcya}to put 40gb cache, before starting your first build :)" 
	cp ~/android/system/.repo/repo /usr/bin/repo 2>/dev/null
	mkdir ~/android/system/.repo/local_manifests 2>/dev/null
        echo -e "${bldorange}   -------------------------------------------------- "
        echo -e "${bldorange}   |   ${txtund}Do not forget to download the source code    | "
        echo -e "${bldorange}   |                                                | "
        echo -e "${bldorange}   |       ${txtund}for your device before compiling.        | "
        echo -e "${bldorange}   |                                                | "
        echo -e "${bldorange}   -------------------------------------------------- "
exit
