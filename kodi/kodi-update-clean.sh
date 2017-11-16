#!/bin/bash

# Script to update and clean kodi video and audio library
# Remote control through HTTP(json rpc) must be enabled

# Library update (add new content to the library)
curl --data-binary '{ "jsonrpc": "2.0", "method": "VideoLibrary.Scan", "id": "VideoLibrary.Scan"}' -H 'content-type: application/json;' http://kodi:kodi@localhost:8080/jsonrpc
curl --data-binary '{ "jsonrpc": "2.0", "method": "AudioLibrary.Scan", "id": "AudioLibrary.Scan"}' -H 'content-type: application/json;' http://kodi:kodi@localhost:8080/jsonrpc

# Library clean (remove content from the library)
curl --data-binary '{ "jsonrpc": "2.0", "method": "VideoLibrary.Clean", "id": "VideoLibrary.Clean"}' -H 'content-type: application/json;' http://kodi:kodi@localhost:8080/jsonrpc
curl --data-binary '{ "jsonrpc": "2.0", "method": "AudioLibrary.Clean", "id": "AudioLibrary.Clean"}' -H 'content-type: application/json;' http://kodi:kodi@localhost:8080/jsonrpc
