#!/bin/bash

# script to send completed torrent name via e-mail
#
# The environment variable TO_EMAIL must be set in your prefs file:
# If you are using the provided install script, you can type:
# echo 'export TO_EMAIL="your@email.com"' > ~/bin/torrent-done.prefs

MAIL="mail"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$DIR/torrent-done.prefs"

echo "Torrent done: $TR_TORRENT_NAME" | $MAIL -s "[torrent-done] $TR_TORRENT_NAME" $TO_EMAIL
