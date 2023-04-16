#!/bin/bash

echo "Installing core packages"

if [ -f /etc/arch-release ]; then
    sudo pacman -S --needed --noconfirm bspwm sxhkd

    echo "Install extra packages (y/n)?"
    read extra_confirm

    if [ $extra_confirm = "y" ]; then
        sudo pacman -S --needed --noconfirm polybar nitrogen picom numlockx polkit-gnome dunst wezterm rofi ttf-iosevka-nerd
    else
        echo "Skipping extra packages"
    fi
fi

if [ -f /etc/debian_version ]; then
    sudo apt update && sudo apt upgrade
    sudo apt install -y bspwm sxhkd
fi

if [ -f /etc/fedora-release ]; then
    sudo dnf update && sudo dnf upgrade
    sudo dnf install -y --needed bspwm sxhkd
fi

echo "Backing up old Bspwm configs"

if [ -d $HOME/.config/bspwm ]; then
    cp -rv $HOME/.config/bspwm $HOME/.config/bspwm.bak
else
    echo "Old configs not found"
fi

echo "Cloning github repo"

git clone "https://github.com/Empyrean-Void/bspwm.git" $HOME/.config/bspwm/
