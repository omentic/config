#!/usr/bin/env python3

# This script requires two things in order to be successful:
# 1) The victim needs to have either `feh` or `nitrogen` installed,
# 2) The prankster needs to know the location (or have a copy) of
#   the victim's usual wallpaper.
# Oh, and Python 3.

# If wanted, this can be configured to launch on start from various
# places - .profile, .i3/config, etc
# Use the following line: `cd ~/[ location of script ] && python hdmi-background.py`

import subprocess
import time

# Set this to the path of the standard background image
bg_path = " assets/bg2.jpg"

def get(cmd): return subprocess.check_output(cmd).decode("utf-8")

# - to count the occurrences of " connected "
def count_screens(xr): return xr.count(" connected ")

# - to run the connect / disconnect command(s)
def run_command(cmd): subprocess.Popen(["/bin/bash", "-c", cmd])

# first count - must launch when only connected to 1 screen
xr1 = None

while True:
    time.sleep(5)
    xr2 = count_screens(get(["xrandr"]))

    # check if there is a change in the screen state
    if xr2 != xr1:
        # print("change")

        # if two screens are detected
        if xr2 == 2:
            run_command("feh --bg-scale --no-fehbg assets/bg.jpg || nitrogen --set-scaled assets/bg.jpg")

        # if only one screen is detected
        elif xr2 == 1:
            run_command("feh --bg-scale --no-fehbg " + bg_path + " || nitrogen --set-scaled " + bg_path)

    # set the second count as initial state for the next loop
    xr1 = xr2
