# bash-scripts
Collection of bash scripts.

## Scripts

- [ffind.sh](ffind/) : Find files and directories in local and remote files (via ssh) with a single instruction.
- [torrent-done.sh](transmission/) : Script to be executed by transmission when a torrent is completed. Sends an e-mail with the torrent info.

## Install
```
git clone https://github.com/lpenap/bash-scripts.git
cd bash-scripts
./install.sh
```
By default, the scripts are installed to $HOME/bin (the folder is created in the process) and the PATH is updated in your ~/.bashrc; to modify the install folder, edit the config.sh file.
