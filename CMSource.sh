#!/bin/bash
# Specify colors utilized in the terminal
normal='tput sgr0'              # White
red='tput setaf 1'              # Red
green='tput setaf 2'            # Green
yellow='tput setaf 3'           # Yellow
blue='tput setaf 4'             # Blue
violet='tput setaf 5'           # Violet
cyan='tput setaf 6'             # Cyan
white='tput setaf 7'            # White
txtbld=$(tput bold)             # Bold
bldred=${txtbld}$(tput setaf 1) # Bold Red
bldgrn=${txtbld}$(tput setaf 2) # Bold Green
bldblu=${txtbld}$(tput setaf 4) # Bold Blue
bldylw=$(txtbld)$(tput setaf 3) # Bold Yellow
bldvlt=${txtbld}$(tput setaf 5) # Bold Violet
bldcya=${txtbld}$(tput setaf 6) # Bold Cyan
bldwht=${txtbld}$(tput setaf 7) # Bold White

clear

        echo -e "${bldred}                                 "
        echo -e "${bldred}   ----------------------------- "
        echo -e "${bldred}   |   CyanogenMod Installer   | "
        echo -e "${bldred}   |                           | "
        echo -e "${bldred}   |  Downloading code source  | "
        echo -e "${bldred}   |                           | "
        echo -e "${bldred}   |    Configurando tu PC     | "
        echo -e "${bldcya}   ----------------------------  "



tput setaf 2
	mkdir -p ~/android/system
	cd ~/android/system
	echo  
	repo init -u git://github.com/CyanogenMod/android.git -b cm-13.0
	time repo sync --force-broken --force-sync --no-clone-bundle --quiet
	echo  
	echo  
	echo -e "${bldcya}El source de CM fue descargado en ~/android/system"
	echo -e "${bldcya}Tu puedes compilar CM en la ubicación ~/android/system"
	echo -e "${bldcya}Recuerda hacer ccache -M 40 para poner 40gb de cache, antes de empezar tu primera build :)" 
	cd ~/android/system
exit
