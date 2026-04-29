{ testpkgs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ 
    zathura
    neovim
    vim
    tree
    ascii
    wget
    htop
    iwd
    tealdeer
    usbutils
    neofetch
    cmatrix

    gnome-tweaks
    gnome-console
    gnome-terminal
    gnome-bluetooth
    gnome-commander
    hardinfo2 
    nil

    testpkgs.man-db
    testpkgs.man-pages
    testpkgs.man-pages-posix
    testpkgs.gcc
    testpkgs.clang
    testpkgs.clang-tools
    testpkgs.git 

    testpkgs.tor-browser
    testpkgs.firefox
    testpkgs.signal-desktop
    testpkgs.tigervnc
    testpkgs.vlc

    gnomeExtensions.mouse-tail
    gnomeExtensions.focus
    gnomeExtensions.ddterm
    gnomeExtensions.desktop-cube
    gnomeExtensions.boost-volume
    gnomeExtensions.gnome-bedtime
    gnomeExtensions.soft-brightness-plus
    ];
}
