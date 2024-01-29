{ config, inputs, lib, pkgs, ... }:
let wallpaper = import ../../../misc/wallpaper/jet_set_radio_alien.jpg;
in {

  home.packages = with pkgs; [ hyprpaper ];

  home.file.".config/hypr/wallpaper.jpg".source =
    ../../../misc/wallpaper/jet_set_radio_alien.jpg;
  home.file.".config/hypr/wallpaper.jpg".target = ".config/hypr/wallpaper.jpg";

  # Generate mandatory config file https://github.com/hyprwm/hyprpaper/issues/87
  home.file.".config/hypr/hyprpaper.conf".text = ''
    ipc = on
    preload  = ~/.config/hypr/wallpaper.jpg
    wallpaper = ,~/.config/hypr/wallpaper.jpg
  '';

  # Start hyprpaper deamon
  systemd.user.services.hyprpaper = {
    Unit = {
      Description = "Wayland wallpaper daemon";
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${lib.getExe pkgs.hyprpaper}";
      Restart = "on-failure";
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };
}
