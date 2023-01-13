#!/bin/bash

git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
meson configure -Dprefix=/usr build
sudo ninja -C build install
