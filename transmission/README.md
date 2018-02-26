# torrent-done
Script for sending e-mails at torrent completion (intended to be invoked by transmission-daemon)

## Rationale
This is intended to be used in a headless environment (or a server) where transmission-daemon is running. Transmission is a good candidate for a download server, you can add torrents via web admin (or transmission-remote), then you can use this script to notify you via e-mail.

## Install and Usage
Install this script using the global [install instructions](https://github.com/lpenap/bash-scripts).
Stop your running transmission-daemon service:
```
sudo service transmission-daemon stop
```
Modify your settings.json (usually in /etc/transmission-daemon/settings.json for debian based linux distros) to include (or modify) the following (change YOUR_USERNAME with your own):
```
"script-torrent-done-enabled": true,
"script-torrent-done-filename": "/home/YOUR_USERNAME/bin/torrent-done",
```
Start your transmission-daemon service:
```
sudo service transmission-daemon start
```
Add your email address to your config file (change your@email.com with your own):
```
echo 'export TO_EMAIL="your@email.com"' > ~/bin/.torrent-done.config
```
you can test the script invoking the file directly:
```
torrent-done
```
Also you can get small torrent files for testing from [academic torrents](http://academictorrents.com) like [this one](http://academictorrents.com/details/b0700675b5b7756ba6243420a9db09380a5d27b2).
You will need to have a working e-mail transfer agent like postfix and an internet connection.Check this article if you would like to send through gmail: [Configure postfix to send mail using gmail and google apps](https://www.linode.com/docs/email/postfix/configure-postfix-to-send-mail-using-gmail-and-google-apps-on-debian-or-ubuntu)

## Features
- Support of custom config file, so you can update/install this script again without configuring your e-mail each time.
- Sends torrent name received from transmission so you can identify your email easily.

## Requirements and Notes
- This script has been tested on GNU bash version 4.4.12 only. It should work with other later versions. Use "bash --version" to check your own.
- Tested with mail (GNU Mailutils) 3.1.1 and postfix 3.1.6-0
