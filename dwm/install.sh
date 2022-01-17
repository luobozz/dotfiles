#!/bin/bash
install_home=$(pwd)

pid=$(ps -ef | grep dwm | grep -v grep | awk '{print $2}')
[[ -n "${pid}" ]] && kill -9 ${pid}
[ -d "~/soft/dwm" ] || rm -rf ~/soft/dwm
mkdir -p ~/soft/dwm
cp -rf ${install_home}/dwm/* ~/soft/dwm
cd ~/soft/dwm
sudo make install

# ps -e|grep st|awk '{print $1}'|xargs kill -9
[ -d "~/soft/st" ] || rm -rf ~/soft/st
mkdir -p ~/soft/st
cp -rf ${install_home}/st/* ~/soft/st
cd ~/soft/st
sudo make install

cp ${install_home}/.xinitrc ~/.xinitrc
