# ffind.sh 
Find files and directories in local and remote files (via ssh) with a single instruction.

## Usage
```
ffind.sh word1 word2 etc
```
## Rationale
I wrote this script to search for files between several media centers (raspberry pi's) and my local computer so I can find duplicates easily.

## Features
- Static config of remote folders. You can configure several folders on servers to be accessed via SSH. Remote "find" (linux) commands are executed vía SSH on the servers. It is recommended to configure your accounts on the servers using key authentication (use password-less keys unless you want to type the password for each server on each call).
- Static config of local folders. The current local folder is added by default (can be removed). To configure, please edit your ffind.sh copy.
- Debug info can be turned on if you want to see additional information.

## Requirements and Notes
- This script has been tested on GNU bash version 4.3.48 only. It should work with other later versions. Use "bash --version" to check your own.
- Tested only with find (GNU findutils) version 4.7.0. Use "find --version" to check your own.

## Configuration
Edit your copy of ffind.sh for more information on what can be configured.

