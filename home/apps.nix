{ config, pkgs, lib, ... }:

{
  programs.tmux = {
    enable = true;
  };

#  programs.git = {
#    enable = true;
#    userName = "codedsprit";
#    userEmail = "roshan0x01@gmail.com";
#  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.gpg = {
    enable = true;
    homedir = "${config.xdg.dataHome}/gnupg";
  };
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Macchiato-Compact-Pink-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "pink" ];
        size = "compact";
        tweaks = [ "rimless" "black" ];
        variant = "macchiato";
      };
    };
  };
}
