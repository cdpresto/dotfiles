#!/bin/bash

# Enable natural scrolling on all pointer devices
for id in $(xinput --list \
    | grep -i "pointer" \
    | sed -E 's/.*id=([0-9]+).*/\1/')
do
    xinput --set-prop "$id" 'libinput Natural Scrolling Enabled' 1 2>/dev/null
done

