
WELCOME!!!

This is my repository for my NixOS devices! I use this repo for my daily drive
devices, updating it whenever I make a change to the said device. It is a very
personal repo, which is why you can see me taking notes in the README.txt.

You may use it as you wish, as it provides a very stable system already!
However the user I have already defined in the flakes is called 'nixuser', so
you will need to make that user, then run 
'git clone https://github.com/Corra3217/nix_world' in nixuser's home directory. After that
cd into the device folder you would like to replicate, then rebuild your system
with that flake accordingly.

Here is a tree to visualise all the files :D

.
├── flake.lock
├── flake.nix
├── lines
│   ├── home
│   │   ├── dotfiles
│   │   │   ├── alacritty
│   │   │   │   ├── alacritty.toml
│   │   │   │   └── themes
│   │   │   │       └── dark_pride.toml
│   │   │   ├── fastfetch
│   │   │   │   └── config.jsonc
│   │   │   ├── hypr
│   │   │   │   ├── hyprland.conf
│   │   │   │   └── hyprpaper.conf
│   │   │   ├── qtile
│   │   │   │   ├── config.py
│   │   │   │   └── __pycache__
│   │   │   │       └── config.cpython-313.pyc
│   │   │   ├── README.txt
│   │   │   ├── rofi
│   │   │   │   ├── config.rasi
│   │   │   │   ├── README.md
│   │   │   │   └── themes
│   │   │   │       └── arc-red-dark.rasi
│   │   │   ├── vim
│   │   │   │   └── vimrc
│   │   │   └── xfce4
│   │   │       ├── desktop
│   │   │       │   ├── accels.scm
│   │   │       │   └── icons.screen0.yaml
│   │   │       ├── helpers.rc
│   │   │       └── xfconf
│   │   │           └── xfce-perchannel-xml
│   │   │               ├── displays.xml
│   │   │               ├── keyboards.xml
│   │   │               ├── parole.xml
│   │   │               ├── thunar.xml
│   │   │               ├── xfce4-appfinder.xml
│   │   │               ├── xfce4-desktop.xml
│   │   │               ├── xfce4-keyboard-shortcuts.xml
│   │   │               ├── xfce4-mime-settings.xml
│   │   │               ├── xfce4-notifyd.xml
│   │   │               ├── xfce4-panel.xml
│   │   │               ├── xfce4-power-manager.xml
│   │   │               ├── xfce4-screensaver.xml
│   │   │               ├── xfce4-session.xml
│   │   │               ├── xfce4-settings-manager.xml
│   │   │               ├── xfce4-taskmanager.xml
│   │   │               ├── xfwm4.xml
│   │   │               └── xsettings.xml
│   │   └── home.nix
│   └── system
│       ├── configuration.nix
│       └── modules
│           ├── default.nix
│           ├── hardware-configuration.nix
│           ├── unfree.nix
│           ├── users.nix
│           └── virtualisation.nix
└── README.txt

19 directories, 42 files

