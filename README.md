# config

Configuration files for my computer.

This git repository is located inside of `XDG_CONFIG_HOME`. Configuration files from other locations (ex. bashrc) are moved here and then symlinked out. The last versions of my configuration files before a big change (ex. switching distributions) are typically tagged.

Currently, I daily drive KDE Plasma 6 under Wayland on Arch. It's nice, I like it. The gesture support is lackluster, but that's about my only complaint. Previously, I ran GNOME with [dash-to-panel](https://github.com/home-sweet-gnome/dash-to-panel), and before that [bspwm](https://github.com/baskerville/bspwm) and [XFCE](https://xfce.org/). In the future, I may revisit my [river](https://github.com/riverwm/river/) setup and write a bspwm-like layout generator for it.

This repository also tracks the configuration of my servers in separate branches. They currently also run Arch, but I would like to switch them over to NixOS in the near future. They're Tailscale'd together behind a cheap VPS which I've found to work very nicely.
