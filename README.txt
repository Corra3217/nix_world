
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
├── desktop
│   ├── flake.lock
│   ├── flake.nix
│   └── system
│       ├── configuration.nix
│       ├── home.nix
│       └── modules
│           ├── default.nix
│           ├── desktops
│           │   ├── default.nix
│           │   ├── hyprland
│           │   │   └── flake.nix
│           │   ├── hyprland.nix
│           │   ├── kde.nix
│           │   ├── qtile.nix
│           │   └── xfce.nix
│           ├── hardware-configuration.nix
│           ├── steam.nix
│           ├── users.nix
│           ├── virtualisation.nix
│           └── wifi.nix
├── dotfiles
│   ├── alacritty
│   │   ├── alacritty.toml
│   │   └── themes
│   │       └── dark_pride.toml
│   ├── fastfetch
│   │   └── config.jsonc
│   ├── hypr
│   │   ├── hyprland.conf
│   │   └── hyprpaper.conf
│   ├── qtile
│   │   └── config.py
│   ├── README.txt
│   ├── rofi
│   │   ├── config.rasi
│   │   ├── README.md
│   │   └── themes
│   │       └── arc-red-dark.rasi
│   └── vim
│       └── vimrc
├── thinkpad
│   ├── flake.lock
│   ├── flake.nix
│   └── system
│       ├── configuration.nix
│       ├── home.nix
│       └── modules
│           ├── default.nix
│           ├── desktops
│           │   ├── default.nix
│           │   ├── hyprland
│           │   │   └── flake.nix
│           │   ├── hyprland.nix
│           │   ├── kde.nix
│           │   ├── qtile.nix
│           │   └── xfce.nix
│           ├── hardware-configuration.nix
│           ├── laptop.nix
│           ├── steam.nix
│           ├── users.nix
│           └── virtualisation.nix
└── virtualbox
    ├── configuration.nix
    ├── flake.lock
    └── flake.nix

21 directories, 46 files
