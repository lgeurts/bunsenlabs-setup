#!/bin/bash

setto="$1"

if [ "$1" == '' ]; then
    exit 0;
fi

if [ ! -x "$(which cpufreq-selector)" ]; then
    exit 0;
fi

governors="$(cpufreq-info  | grep 'available.*governors' | head -n1)";

if ! grep -q "$setto" <<< "$governors"; then
    echo "this governor is not available"
    exit 0;
fi

declare out;
for proc in $(cat /proc/cpuinfo | grep processor | sed -r 's/^processor\s+:\s+(.*)$/\1/'); do
    out+="CPU#$proc governor is to '$setto';"
    cpufreq-selector -c $proc -g $setto
done

if [ -x "$(which notify-send)" ]; then
    THEME=$(gsettings get org.gnome.desktop.interface icon-theme | tr -d "'")
    ICON="/usr/share/icons/${THEME}/rest/of/path/to/icon.svg"

    notify-send -a "cpufreq-selector" "$(tr ';' "\n" <<< $out)"
fi

exit 0;
