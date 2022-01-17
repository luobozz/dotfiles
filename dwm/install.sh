#!/bin/bash
pid=$(ps -ef | grep dwm | grep -v grep | awk '{print $2}')
[[ -n "${pid}" ]] && kill -9 ${pid}
[ -d "~/soft/dwm" ] || rm -rf ~/soft/dwm
mkdir -p ~/soft/dwm
cp ./.xinitrc ~/.xinitrc
cp -rf ./dwm/* ~/soft/dwm
cd ~/soft/dwm
# ls
pwd
sudo make install