# System pkgs for all users

{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    cmake
    go
    caido
    termusic
    brillo
    unzip
    zip
    gcc
    pstree
    file
    nsxiv
    tree
    fx
    zig
    aria2
    shfmt
    pkg-config
    wezterm


    acpi
    doas

    xdg-desktop-portal-hyprland
    brave
    yt-dlp

    pavucontrol
    wireplumber


    pulseaudio

    tmux
    imagemagick
    mpv

    lua-language-server
    lua
    cava
    python3
    zathura
    numbat

  ];
}

