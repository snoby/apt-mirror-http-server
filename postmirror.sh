#!/bin/sh -e

## Anything in this file gets run AFTER the mirror has been run.
## Put your custom post mirror operations in here (like rsyncing the installer
## files and running clean.sh automatically)!

## Example of grabbing the extra installer files from Ubuntu (Note: rsync needs
## to be installed and in the path for this example to work correctly)


#
# You probably want to make your own postmirror.sh and mount it via docker
# docker docker run -v /var/repos/apt-mirror:/var/spool/apt-mirror \
#           -v /etc/apt/mirror.list:/etc/apt/mirror.list   \
#           -v ./:/tmp/postmirror/                         \
#           --restart=always -d -p 80                      \
#           --name=apt-mirror                              \
#           --cpu-shares 512                               \
#           -m 512m                                        \
#           --label traefik.enable=true                    \
#           --label traefik.frontend.passHostHeader=true   \
#           seterrychen/apt-mirror-http-server
#

#rsync --recursive --times --links --hard-links --delete --delete-after rsync://mirror.anl.gov/ubuntu/dists/trusty/main/debian-installer /var/spool/apt-mirror/mirror/archive.ubuntu.com/ubuntu/dists/trusty/main/
#rsync --recursive --times --links --hard-links --delete --delete-after rsync://mirror.anl.gov/ubuntu/dists/trusty/main/dist-upgrader-all/ /var/spool/apt-mirror/mirror/archive.ubuntu.com/ubuntu/dists/trusty/main/
#rsync --recursive --times --links --hard-links --delete --delete-after rsync://mirror.anl.gov/ubuntu/dists/trusty/main/installer-amd64/ /var/spool/apt-mirror/mirror/archive.ubuntu.com/ubuntu/dists/trusty/main/
rsync --recursive --times --links --hard-links --delete --delete-after rsync://mirror.cogentco.com/pub/linux/ubuntu/dists/xenial/main/installer-amd64/ /var/spool/apt-mirror/mirror/mirror.cogentco.com/pub/linux/ubuntu/dists/xe    nial/main/
#rsync --recursive --times --links --hard-links --delete --delete-after rsync://mirror.anl.gov/ubuntu/dists/trusty/main/installer-i386/ /var/spool/apt-mirror/mirror/archive.ubuntu.com/ubuntu/dists/trusty/main/
