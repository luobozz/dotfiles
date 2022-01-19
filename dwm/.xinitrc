#!/bin/bash

if [ -d $HOME/.xinitrc.d ]; then
  for i in $HOME/.xinitrc.d/*.sh; do
    if [ -r $i ]; then
      . $i &
    fi
  done
  unset i
fi
exec dwm & picom & st 