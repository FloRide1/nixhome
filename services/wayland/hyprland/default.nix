{ config, inputs, lib, pkgs, ... }: {
  imports = [ ./config.nix ./hyprpaper.nix ./hypridle.nix ];

  home.sessionVariables = {
    # upscale steam
    GDK_SCALE = "1";
  };

  # enable hyprland
  wayland.windowManager.hyprland.enable = true;
}
