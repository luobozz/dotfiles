#!/bin/bash
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export TERMINAL=st
export all_proxy=http://127.0.0.1:7890
#export https_proxy=http://127.0.0.1:7892
#export _JAVA_AWT_WM_NONREPARENTING=1 
#export AWT_TOOLKIT=MToolkit 

if [ -d $HOME/.xinitrc.d ]; then
  for i in $HOME/.xinitrc.d/*.sh; do
    if [ -r $i ]; then
      . $i &
    fi
  done
  unset i
fi
wmname LG3D
fcitx5 &
#dunst &
flameshot &
exec dwm &
xrandr --output DVI-D-0 --primary &
$(sleep 1s && "$HOME/.local/bin/polybar/launch-polybar") & 
picom -experimental-backends --no-vsync --config ~/.config/picom/picom.conf
