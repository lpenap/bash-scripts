#!/bin/bash

####################################################################
# ffinder v1.0 by Luis Augusto Peña Pereira                        #
#          File finder for remote (via ssh) and local folders.     #
#          Default behaviour: search on current folder only.       #
#                                                                  #
# https://github.com/lpenap/bash-scripts                           #
####################################################################

# Config ###########################################################

### This array declares folders on remote servers to be searched
### through ssh.
### Use the user@serverAddress as key on each entry in this array.
### Each folder should have 2 sequential entries in the REMOTES_ARRAY.
### The first entry should be the absolute path on the remote server.
### The second entry should be the maxdepth parameter to the find command.
### A negative maxdepth value will search the entire folder tree.
### Uncomment the REMOTES_ARRAY values and modify to fit your needs.
### Take notice that this is a 2-dimensional array, each remote
### server can have several specified folders. Please increase
### the second index accordingly for each server.
declare -A REMOTES_ARRAY
#REMOTES_ARRAY['user@192.168.1.111',0]='/path/to/folder' 
#REMOTES_ARRAY['user@192.168.1.111',1]='1'

#REMOTES_ARRAY['user@192.168.1.111',2]='/path/to/other/folder'
#REMOTES_ARRAY['user@192.168.1.111',3]='2'

#REMOTES_ARRAY['userX@otherserver.com',0]='/path/to/folder' 
#REMOTES_ARRAY['userX@otherserver.com',1]='-1'

### Array for local folders to be searched.
### The array key should be the actual folder and the value
### should be the maxdepth parameter to the find command.
### A negative maxdepth value will search the entire folder tree.
### Uncomment the LOCAL_ARRAY values and modify to fit your needs.
### Current folder is added as default.
declare -A LOCAL_ARRAY
#LOCAL_ARRAY['/home/user/downloads/']='1'
LOCAL_ARRAY['.']='-1'

### Commands and arguments
### If you use linux locally and on the servers, leave this
### parameters as is.
SSH=ssh
FIND=find
MAXDEPTH_ARG=-maxdepth
NAME_ARG=-iname
AND_ARG=-a

DEBUG=false

# End of Config #####################################################

function evalCommand {
	if [ $DEBUG = true ]; then
		echo
		echo "  Executing: $1"
		echo "  Search results:"
	fi
	eval ${1}
}

function processRemoteFolder {
	server=$1
	folder=$2
	maxdepth=$3
	findArgs=$4
	if [ $maxdepth -eq '-1' ]; then
		COMMAND="$SSH $server \"$FIND $folder $findArgs\""
	else
		COMMAND="$SSH $server \"$FIND $folder $MAXDEPTH_ARG $maxdepth $findArgs\""
	fi
	evalCommand "$COMMAND"
}

function processLocalFolder {
	folder=$1
	maxdepth=$2
	findArgs=$3

	if [ $maxdepth -eq '-1' ]; then
		COMMAND="$FIND $folder $findArgs"
	else
		COMMAND="$FIND $folder $MAXDEPTH_ARG $maxdepth $findArgs"	
	fi
	evalCommand "$COMMAND"
}

function searchInDirList {
	list=$1
}

if [ $# -lt 1 ]; then
	echo "Search string required."
	exit 1
fi

# Build -name string array for find command
findArgs="\("
first=true
for arg in $@; do
	if [ $first = true ]; then
		findArgs="$findArgs $NAME_ARG '*$arg*'"
		first=false
	else
		findArgs="$findArgs $AND_ARG $NAME_ARG '*$arg*'"
	fi
done
findArgs="$findArgs \)"

# Cycle through remote directories
step=0
server=""
folder=""
for i in ${!REMOTES_ARRAY[@]}; do
	if [ $step = 0 ]; then
		server="${i:0:-2}"
		folder="${REMOTES_ARRAY[$i]}"
		step=1
	else
		processRemoteFolder $server $folder ${REMOTES_ARRAY[$i]} "$findArgs"
		step=0
	fi
		
done

# Cycle through local directories
for i in ${!LOCAL_ARRAY[@]}; do
	processLocalFolder $i ${LOCAL_ARRAY[$i]} "$findArgs"
done
 
