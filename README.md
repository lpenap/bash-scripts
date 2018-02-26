# bash-scripts
Collection of bash scripts.

## Scripts

- [ffind](ffind/) : Find files and directories in local and remote files (via ssh) with a single instruction.
- [torrent-done](transmission/) : Script to be executed by transmission when a torrent is completed. Sends an e-mail with the torrent info.

## Install
```
git clone https://github.com/lpenap/bash-scripts.git
cd bash-scripts
./install-to-bin.sh
```
By default, the scripts are installed to $HOME/bin (or ~/bin) (the folder is created in the process) and the PATH is updated in your ~/.bashrc; to modify the install folder, edit the install-to-bin.sh file.
