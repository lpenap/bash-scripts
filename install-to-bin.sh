#!/bin/bash

PATH_TO_INSTALL="$HOME/bin"

source "filelist"

if [ -d "$PATH_TO_INSTALL" ]; then
	echo "$PATH_TO_INSTALL found."
else
	echo "$PATH_TO_INSTALL not found, creating."
	mkdir $PATH_TO_INSTALL
fi

echo "Copying scripts to $PATH_TO_INSTALL"
for i in "${SCRIPTS[@]}"; do
	cp "$i" "$PATH_TO_INSTALL/."
done
cmd="chmod +x $PATH_TO_INSTALL/*"
eval ${cmd}
echo "Updating permissions and PATH variable"
echo "export PATH=\"$HOME/bin:$PATH\"" >> "$HOME/.bashrc"
echo "Done."

source "$HOME/.bashrc"
