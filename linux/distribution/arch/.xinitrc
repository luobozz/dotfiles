#!/bin/bash

if [ -d $HOME/.xinitrc.d ]; then
  for i in $HOME/.xinitrc.d/*.sh; do
    if [ -r $i ]; then
      . $i &
    fi
  done
  unset i
fi
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export http_proxy=http://127.0.0.1:7892
export https_proxy=http://127.0.0.1:7892
export _JAVA_AWT_WM_NONREPARENTING=1 
export AWT_TOOLKIT=MToolkit 
wmname LG3D
fcitx5 &
dunst &
exec dwm & picom --no-vsync 
