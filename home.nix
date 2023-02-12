{ config, pkgs, pkgs-unstable, ... }:

{
  home.username = "samuel";
  home.homeDirectory = "/home/samuel";
  
  home.packages = [
    pkgs.dmenu
  ];
  
  home.stateVersion = "22.11";
  
  programs.home-manager.enable = true;
  
  programs.helix = {
    enable = true;
    package = pkgs-unstable.helix;
    settings = {
      theme = "gruvbox";
    };
  };
  
  programs.alacritty.enable = true;
  programs.brave.enable = true;
  programs.librewolf.enable = true;
  programs.mpv.enable = true;
  programs.yt-dlp.enable = true;

  programs.git = {
    enable = true;
    userName = "Samuel Dudík";
    userEmail = "24730635+dudik@users.noreply.github.com";
  };

  programs.bash.enable = true;
  programs.bash.profileExtra = ''
    if [ -z $DISPLAY ] && [ $XDG_VTNR -eq 1 ]; then
      exec startx
    fi
  '';

  services.sxhkd = {
    enable = true;
    keybindings = {
      "alt + a" = "alacritty";
    };
  };

  xsession.enable = true;
  xsession.windowManager.bspwm.enable = true;
  xsession.scriptPath = ".xinitrc";
}
