#! /bin/bash
# wallpaper-changer.sh
# v.1
#________________________________________________________________________________________________________
# This script provides a wallpaper change among the files contained in the directory specified as arg1 ($1),
# every periode of time set as arg2 ($2).

# Two modes can be set as arg3 ($3) : linear (default: change as sorted in the directory) or random.
# Specifie r or R to get the random mode. 

# Use : ./ wallpaper-changer.sh /path/of/your/directory time_in_seconds mode
# example : ./ wallpaper-changer.sh ~/home/user/wallpapers 3600 r   or  ./ wallpaper-changer.sh ~/home/user/wallpapers 60

# You can launch it at startup by entering the following command in your autostart :
#    ## Launch wallpaper-changer
#    (sleep 10s && /home/user/bin/wallpaper-changer.sh ~/home/user/wallpapers 3600 r) &

# Note1 : It does not do any control of the file's type, so make sure the specified directory
# only contains image files.

# Note2 : Can't work if file's names contain any spaces.
#_______________________________________________________________________________________________________

path="$1"
# If argument 1 is empty, exit the script with error message (if launched in a terminal).
if [ -z "$1" ]; then
    echo "arg1 is empty, specify image files path"
    exit 1
fi

delay="$2"
# If argument 2 is empty, use 600 seconds as default.
if [ -z "$2" ]; then
    delay=600
fi

mode="$3"
# If argument 3 is empty, set it as l (for linear) 
if [ -z "$3" ]; then
    mode=l
fi

NUM=0

while true
do 	sleep $delay
	# list the files in the directory :
	ALIST=( `ls -w1 "$path"` )

	# Count the files :
	RANGE=${#ALIST[@]}

	if [ $mode = "r" ] || [ $mode = "R" ]; then
		# Random mode :
		NEWNUM=$NUM
			while 	[[ $NEWNUM = $NUM ]]
			do 		let NEWNUM="$RANDOM % $RANGE"
			done
		NUM=$NEWNUM
	else 
		# Linear mode :
		let NUM="$(($NUM+1)) % $RANGE"
	fi
	
	# Change the wallpaper using nitrogen :
	nitrogen --set-auto $path/${ALIST[$NUM]}

done

exit 0
