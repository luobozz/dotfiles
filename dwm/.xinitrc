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
fcitx &
exec dwm & picom --no-vsync