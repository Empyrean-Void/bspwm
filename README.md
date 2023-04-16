# Bspwm

Dotfiles for my Bspwm rice.

## Dependencies

- **Bspwm** (Window manager)
- **Sxhkd** (Shortcut daemon)
- **Polybar** (Panel)

## Optional Dependencies (Highly recommended)

- **Nitrogen** (Wallpaper)
- **Picom** (Compositor)
- **Numlockx** (Enable num lock)
- **Polkit Gnone** (Policy kit)
- **Dunst** (Notifications)
- **Wezterm** (Terminal)
- **Rofi** (Menu)

## Install

### Script based

- Download the install script:

`wget https://raw.githubusercontent.com/Empyrean-Void/bspwm/main/scripts/install.sh`

- Execute the script:

`./install.sh`

### Building from source

- Install the needed dependencies:

`yay -S bspwm sxhkd`

- Optionally install the following packages:

`yay -S polybar nitrogen picom numlockx polkit-gnome dunst wezterm rofi ttf-iosevka-nerd`

- Backup your old Bspwm config (if applicable):

`mv ~/.config/bspwm/ ~/.config/bspwm.bak/`

- Clone this repository:

`git clone https://github.com/Empyrean-Void/bspwm.git ~/.config/bspwm/`

## Autostart

To configure startup applications edit `scripts/autostart`.

**Note:** Some autostart items might not be installed as they are specific to my system. When in doubt comment it out.

## Multi Monitor Support

Multi monitors can be setup by editing `bspwmrc`. In the display settings section, configure the correct output names and define your workspace layout.

## Themes

Themes are stored in the `themes` directory. To create a new theme, copy and rename an existing theme and edit `theme.bash`.
