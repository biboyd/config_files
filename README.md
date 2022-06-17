# config_files
Just some of the configuration files I use for different software. Made just so I could keep track of somethings and the changes I make. Also, if anyone finds this they are free to borrow anything that they didn't know about before.

## configure system
The `configure_system.sh` script will create hardlinks between this file and the appropriate config files that are either dot files in the homedirectory or have their own configuration directories under `~/.config/`. This makes configuring a new system easy as well as making edits to the config files can then be easily tracked on via this git Repo and spread to other systems accordingly.

## convenient scripts
This holds a couple of useful scripts that I add onto my path for easy access

* `movie.sh`: This is a pretty simple script that makes it easy to combine a bunch of images into a movie using ffmpeg

* `restart_wifi.sh`: This script just tries to reconnect to the current wifi. For some reason wifi can just stop working so this does a simple disconnect then reconnect after a brief wait. I've tried to set it up to continually try until reconnected so sometimes may need to be manuallys stopped.

## wrappers
This is where I'll put any wrappers to common commands. For example, when need to load in a different java version before using Nvidia Visual profile thing.


