# Bspwm

Dotfiles for my Bspwm rice.

## Dependencies

- **Bspwm** (Window manager)
- **Sxhkd** (Shortcut daemon)
- **Polybar** (Panel)
- **Nitrogen** (Wallpaper)
- **Picom** (Compositor)
- **Numlockx** (Enable num lock)
- **Polkit Gnone** (Policy kit)
- **Dunst** (Notifications)

## Install

- Install the needed dependencies:

`yay -S bspwm sxhkd polybar nitrogen picom numlockx polkit-gnome dunst`

- Backup your old Bspwm config (if applicable):

`mv ~/.config/bspwm/ ~/.config/bspwm.bak/`

- Clone this repository:

`git clone --depth-1 https://github.com/Empyrean-Void/bspwm.git ~/.config/bspwm/`

## Autostart

**It should be noted that certain autostart items (such as keyboard rgb) are highly specific to my system.**

### Configuration

To configure autostart items edit the autostart file found in the scripts directory.

## Screenshots

<!-- <img src="images/screenshot.png" width="800" height="450"> -->

## Extras

For a complete setup, visit my other repositories.

- [**Polybar**](https://github.com/Empyrean-Void/polybar.git)
- [**Rofi**](https://github.com/Empyrean-Void/rofi.git)
