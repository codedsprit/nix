{ pkgs, ... }: {
  programs.password-store = {
    enable = true;
    settings = {
      PASSWORD_STORE_KEY = "2B104B77029142ACF4D6F093AAEFE245F1673E11";
      PASSWORD_STORE_CLIP_TIME = "30";
    };
  };
}
