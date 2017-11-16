#!/bin/bash

# script to search kodi log for items not added to the kodi library
grep "won't be added" -i /home/pi/.kodi/temp/kodi.log | cut -d"'" -f2 > /home/pi/not_indexed.log

