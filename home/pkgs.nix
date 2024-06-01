# Home per-user pkgs

{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    git-cliff
    slurp
    gopls
    nodePackages_latest.bash-language-server


    eza
    zoxide
    ripgrep
    grim
    brave

    bat
    python311Packages.pip
    just
    stylua
    pass

    nil
    fzf

    mdbook
    neovim
    openvpn

    scriptisto

    wofi
    wl-clipboard
    wf-recorder
    hyprpaper
    alacritty
    burpsuite

    rustup
    #cargo-watch
    #pentesting 
    nmap
    rustscan 
    samba
    exploitdb
    gobuster
    firefox

  ];
}
