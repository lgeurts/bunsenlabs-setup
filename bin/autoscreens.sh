#!/bin/bash

# Put this script in your autostart.sh file as "/path/to/script/autoscreens.sh &".
# Works only for single screen - dual screen setups.

# Setting the initial states of the screen:
currentState=''
oldState='single'
secondDisplay='' # Second display port name will be stored here, need it when it's not connected as well so xrandr will be able to set it after it's been disconnected.

function checkConnected { # Will check if any new display has been connected or disconnected to the system. Runs the next function if anything new happens.
	
	if [[ "`xrandr -q | grep ' connected' | wc -l`" == 1 ]]; then
		currentState='single'
	else
		currentState='double'
	fi
	
	if [[ $currentState != $oldState ]]; then
		doubleConnected
	fi
	
	}
	
function doubleConnected {
	
	# Grab the connected display's ports and log them in an array:
	connectedDisplays="`xrandr -q | grep ' connected' | sed 's/\s.*$//'`" 
    connectedArray=($connectedDisplays)
    
    # Grab the resolutions of the connected displays, log them in an array, same order as the display's array:
    resolutions="`xrandr -q | sed -n '/\ connected/{n;p}'`"
    arr2=($resolutions)
    resolutionsArray=()
    
    for i in "${!arr2[@]}"; do
        if [[ ${arr2[i]} == *"x"* ]] ; then
        resolutionsArray+=(${arr2[i]})
    fi
    done

	# Set the position of the second display. It will be set exactly to the left of the first display, top edges perfectly aligned:

    position="`echo ${resolutionsArray[0]} | sed 's/x.*$//'`" # Grab the width of the first display:
    exo="x0"
    pos="$position$exo" # Add "x0" to the width, so that second position can be set:
    
    # Check the current state of connected displays:
    if [[ $currentState = "double" ]] && [[ $currentState != $oldState ]]; then
		secondDisplay=${connectedArray[1]} # Logs the name of the second display's port so it can use it to set it as --off if it disconnects.
		
		# Sets up the double screen as, top edge perfectly aligned, first display on the left, second to the right, and sets up the SECOND display as primary:
        xrandr --output ${connectedArray[0]} --mode ${resolutionsArray[0]} --pos 0x0 --rotate normal --output ${connectedArray[1]} --mode ${resolutionsArray[1]} --pos $pos --primary --rotate normal
        oldState='double'
        nitrogen --restore # Change this with the appropiate command of your wallpaper manager if you don't use nitrogen:
    elif [[ $currentState = "single" ]] && [[ $currentState != $oldState ]]; then
        xrandr --output ${connectedArray[0]} --mode ${resolutionsArray[0]} --pos 0x0 --rotate normal --output $secondDisplay --off
        oldState='single'
        nitrogen --restore
    fi 
	
	}

while sleep 5; do checkConnected; done # Execute "checkConnected" function every 5 seconds.
