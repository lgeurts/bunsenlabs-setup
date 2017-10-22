#!/bin/bash

RC="$HOME/.config/conky/conkyrc_dzen_mine"
FG="#E0DED3"
BG="#33333D"
ALIGN="bottom"
WIDTH="1280"
HEIGHT="12"
FONT="Ohsnap:size=7"
XPOS="0"
YPOS="1756"

conky -c $RC | dzen2 -e 'button2=;' -fg $FG -bg $BG -ta $ALIGN -h $HEIGHT -x $XPOS -y $YPOS -fn "$FONT" &

exit 0
