#!/bin/bash

# Last update : 24 June 2017

# Written by : Luc Geurts (/Luge)
# GitHub : https://github.com/lgeurts
# E-mail : lgeurts@protonmail.com

# First we hide all the error messages
exec 2>/dev/null

# Now we check if the directory that we are going to save the
# file to already exists, if it exists we prompt a message and exit

# The name of the folder must be given at the arguments
FILE=$1

echo '[*] i3 backup script will now save your current configuration'

if mkdir ../Backups/$FILE
  then
  echo '  [+] Folder created successfully'
else
  echo '  [-] Error, folder might already exist. Exiting...'
  exit
fi

mkdir ../Backups/$FILE/.themes/

if cp -ar ~/.themes/'i3 Oomox Colors' ../Backups/$FILE/.themes/'i3 Oomox Colors'
  then
  echo '  [+] Saved ~/.themes/i3 Oomox Colors successfully'
else
  echo '  [-] Failed to save ~/.themes/i3 Oomox Colors'
fi

mkdir ../Backups/$FILE/.resources/

if cp ~/.Xresources ../Backups/$FILE/.resources/.Xresources
  then
  echo '  [+] Saved ~/.Xresources successfully'
else
  echo '  [-] Failed to save ~/.Xresources'
fi

if cp ~/.Xresources.old ../Backups/$FILE/.resources/.Xresources.old
  then
  echo '  [+] Saved ~/.Xresources.old successfully'
else
  echo '  [-] Failed to save ~/.Xresources.old'
fi

if cp ~/.extend.Xresources ../Backups/$FILE/.resources/.extend.Xresources
  then
  echo '  [+] Saved ~/.extend.Xresources successfully'
else
  echo '  [-] Failed to save ~/.extend.Xresources'
fi

mkdir ../Backups/$FILE/.config/
mkdir ../Backups/$FILE/.config/polybar/

if cp ~/.config/polybar/config ../Backups/$FILE/.config/polybar/config
then
  echo '  [+] Saved ~/.config/polybar/config successfully'
else
  echo '  [-] Failed to save ~/.config/polybar/config'
fi

if cp ~/.config/polybar/launch.sh ../Backups/$FILE/.config/polybar/launch.sh
then
  echo '  [+] Saved ~/.config/polybar/launch.sh successfully'
else
  echo '  [-] Failed to save ~/.config/polybar/config'
fi

if cp ~/.config/compton.conf ../Backups/$FILE/.config/compton.conf
  then
  echo '  [+] Saved ~/.config/compton.conf successfully'
else
  echo '  [-] Failed to save ~/.config/compton.conf'
fi

if cp ~/.config/compton.conf.old ../Backups/$FILE/.config/compton.conf.old
  then
  echo '  [+] Saved ~/.config/compton.conf.old successfully'
else
  echo '  [-] Failed to save ~/.config/compton.conf.old'
fi

mkdir ../Backups/$FILE/.i3/

if cp ~/.i3/config ../Backups/$FILE/.i3/config
  then
  echo '  [+] Saved ~/.i3/config successfully'
else
  echo '  [-] Failed to save ~/.i3/config'
fi

mkdir ../Backups/$FILE/Other/

if cp ~/.dmenurc ../Backups/$FILE/Other/.dmenurc
  then
  echo '  [+] Saved ~/.dmenurc successfully'
else
  echo '  [-] Failed to save ~/.dmenurc'
fi

if cp ~/.vimrc ../Backups/$FILE/Other/.vimrc
  then
  echo '  [+] Saved ~/.vimrc successfully'
else
  echo '  [-] Failed to save ~/.vimrc'
fi

mkdir ../Backups/$FILE/.config/dunst/

if cp ~/.config/dunst/dunstrc ../Backups/$FILE/.config/dunst/dunstrc
then
  echo '  [+] Saved ~/.config/dunst/dunstrc successfully'
else
  echo '  [-] Failed to save ~/.config/dunst/dunstrc'
fi

if cp ~/.xsettingsd ../Backups/$FILE/.xsettingsd
then
  echo '  [+] Saved ~/.xsettingsd successfully'
else
  echo '  [-] Faled to save ~/.xsettingsd'
fi

echo "[!] Your theme is now saved under ../Backup/ directory"

echo '[*] i3 backup script will now exit...'

exit
