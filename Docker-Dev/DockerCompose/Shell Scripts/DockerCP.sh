#!/bin/bash
# d14f52f794fd = qbittorrent
# echo "docker cp qbittorrent:/downloads/complete /srv/dev-disk-by-uuid-73dc2c92-3a9f-4f48-a24b-389340b2bd97/home/torrents"
#####
# Dcon't use echo here when executing straight bash commands just write out the command

docker cp qbittorrent:/downloads/complete /srv/dev-disk-by-uuid-73dc2c92-3a9f-4f48-a24b-389340b2bd97/home/torrents
