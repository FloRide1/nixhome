{ config, pkgs, ... }:
let

  mypolybar = pkgs.polybar.override {
    alsaSupport = true;
    githubSupport = true;
    mpdSupport = true;
    pulseSupport = true;
  };

  bars = builtins.readFile ./bars.ini;
  colors = builtins.readFile ./colors.ini;
  mods1 = builtins.readFile ./modules.ini;
  mods2 = builtins.readFile ./user_modules.ini;

  # FIXME: Make script for powermenu
in {
  home.file.".config/polybar/scripts" = {
    source = ./scripts;
    recursive = true;
  };

  services.polybar = {
    enable = true;
    package = mypolybar;
    config = ./config.ini;
    extraConfig = bars + colors + mods1 + mods2;
    script = ''
      # Launch the bar
      polybar top &
      polybar bottom &
    '';
  };
}
