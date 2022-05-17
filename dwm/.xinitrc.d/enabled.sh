#!/bin/bash
function clash(){
    ps -ef | grep clash | awk '{print $2}' | xargs kill -9
    ~/soft/clash/start-clash.sh
}

function blueman(){
    nohup blueman-applet >/dev/null &
}

clash
blueman

