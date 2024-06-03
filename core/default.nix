{ config, pkgs, ... }:

let
  UserName = "pwn";
  HostName = "writer";

in
{
  imports = [ ./hardware.nix ./pkgs.nix ];

  boot = {
    loader.systemd-boot.enable = true;
    initrd.verbose = false;
    consoleLogLevel = 0;
    kernelParams = [
      "quiet"
      "udev.log_level=3"
      "nvidia_drm.fbdev=1"
      "nvidia_drm.modeset=1"
    ];
    loader.efi.canTouchEfiVariables = true;
    kernelModules = [ "coretemp" "cpuid" "v4l2loopback" ];
  };

  networking.hostName = HostName;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Kathmandu";

  i18n.defaultLocale = "en_US.UTF-8";

  users.users.${UserName} = {
    isNormalUser = true;
    description = "User space for ${UserName}";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" "storage" "docker"];
    packages = with pkgs; [ ];
  };

  programs.zsh.enable = true;
  virtualisation.docker.enable = true;


  programs.hyprland = {
    enable = true;
    xwayland = { enable = true; };
  };

  programs.nano.enable = false;
  programs.nano.syntaxHighlight = false;

  programs.light.enable = true;

  fonts.packages = with pkgs;
    [ (nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) ];

  users.defaultUserShell = pkgs.zsh;

  security.sudo.enable = true;

  sound.enable = false;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  system.stateVersion = "23.11";
}

