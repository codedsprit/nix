{ config, pkgs, lib, input, ... }:

{
  home.username = "pwn";
  home.homeDirectory = "/home/pwn";
  xdg.dataHome = "${config.home.homeDirectory}/.local/share";

  imports = [ 
  ./dedicated.nix 
  ./pkgs.nix 
  ./pass.nix
  ];

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
