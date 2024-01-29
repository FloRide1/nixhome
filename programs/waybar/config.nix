{ config, pkgs, default, ... }: {
  # Add hyprctl to waybar env : https://github.com/hyprwm/Hyprland/issues/1835
  systemd.user.services.waybar.Service.Environment =
    "PATH=/run/wrappers/bin:${pkgs.hyprland}/bin";

  programs.waybar.settings = {
    mainBar = {
      layer = "top";
      position = "top";

      modules-left = [ "hyprland/workspaces" "custom/right-arrow-dark" ];
      modules-center = [
        "custom/left-arrow-dark"
        "clock#1"
        "custom/left-arrow-light"
        "custom/left-arrow-dark"
        "clock#2"
        "custom/right-arrow-dark"
        "custom/right-arrow-light"
        "clock#3"
        "custom/right-arrow-dark"
      ];
      modules-right = [
        "custom/left-arrow-dark"
        "network"
        "custom/left-arrow-light"
        "custom/left-arrow-dark"
        "memory"
        "custom/left-arrow-light"
        "custom/left-arrow-dark"
        "cpu"
        "custom/left-arrow-light"
        "custom/left-arrow-dark"
        "battery"
        "custom/left-arrow-light"
        "custom/left-arrow-dark"
        "pulseaudio"
        "custom/left-arrow-light"
        "custom/left-arrow-dark"
        "tray"
      ];

      "custom/left-arrow-dark" = {
        format = "";
        tooltip = false;
      };

      "custom/left-arrow-light" = {
        format = "";
        tooltip = false;
      };

      "custom/right-arrow-dark" = {
        format = "";
        tooltip = false;
      };

      "custom/right-arrow-light" = {
        format = "";
        tooltip = false;
      };

      "hyprland/workspaces" = {
        # Enable scroll in workspaces modules
        format = "{name}";
        on-scroll-up = "${pkgs.hyprland}/bin/hyprctl dispatch workspace e+1";
        on-scroll-down = "${pkgs.hyprland}/bin/hyprctl dispatch workspace e-1";
        on-click = "activate";
      };

      "clock#1" = {
        format = "{:%a}";
        tooltip = false;
      };
      "clock#2" = {
        format = "{:%H:%M}";
        tooltip = false;
      };
      "clock#3" = {
        format = "{:%m-%d}";
        tooltip = false;
      };

      "pulseaudio" = {
        format = "{icon} {volume:2}%";
        format-bluetooth = "{icon}  {volume}%  ";
        format-muted = "MUTE";
        format-icons = {
          headphones = "";
          default = [ "" "" ];
        };
        scroll-step = 5;
        on-click = "${pkgs.pamixer}/bin/pamixer -t";
        on-click-right = "${pkgs.pavucontrol}/bin/pavucontrol";
      };

      "memory" = {
        interval = 5;
        format = "Mem {}%";
      };

      "cpu" = {
        "interval" = 5;
        "format" = "CPU {usage:2}%";
      };

      "battery" = {
        states = {
          good = 95;
          warning = 30;
          critical = 15;
        };
        format = "{icon} {capacity}%";
        format-icons = [ "" "" "" "" "" ];
      };

      "disk" = {
        interval = 5;
        format = "Disk {percentage_used:2}%";
        path = "/";
      };

      "tray" = { icon-size = 20; };

      "network" = {
        interface = "wlp1s0";
        format-wifi = " {essid} {icon} ";
        format-icons = [ "󰤟" "󰤢" "󰤥" "󰤨" ];
        format-ethernet = "{ipaddr}/{cidr} 󰈀";
        format-disconnected = "";
      };
    };
  };
}
