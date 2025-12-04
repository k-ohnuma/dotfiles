#!/bin/sh
sleep 3

DEVICE="ELAN06FA:00 04F3:327E Touchpad"

xinput set-prop "$DEVICE" "libinput Scrolling Pixel Distance" 50
xinput set-prop "$DEVICE" "libinput Tapping Drag Enabled" 0
