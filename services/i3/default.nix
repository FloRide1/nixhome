{ pkgs, lib, ... }:

let

  ws1 = "1";
  ws2 = "2";
  ws3 = "3";
  ws4 = "4";
  ws5 = "5";
  ws6 = "6";
  ws7 = "7";
  ws8 = "8";
  ws9 = "9";
  ws0 = "0";

in {
  enable = true;

  config = rec {
    modifier = "Mod4";
    bars = [ ];

    window.border = 2;

    gaps = {
      inner = 2;
      outer = 0;
    };

    keybindings = lib.mkOptionDefault {

      "${modifier}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
      "${modifier}+d" = "exec ${pkgs.rofi}/bin/rofi -modi drun -show drun";
      "${modifier}+Shift+q" = "kill";

      # Custom workspaces names
      "${modifier}+1" = "workspace ${ws1}";
      "${modifier}+2" = "workspace ${ws2}";
      "${modifier}+3" = "workspace ${ws3}";
      "${modifier}+4" = "workspace ${ws4}";
      "${modifier}+5" = "workspace ${ws5}";
      "${modifier}+6" = "workspace ${ws6}";
      "${modifier}+7" = "workspace ${ws7}";
      "${modifier}+8" = "workspace ${ws8}";
      "${modifier}+9" = "workspace ${ws9}";
      "${modifier}+0" = "workspace ${ws0}";

      "${modifier}+Shift+1" = "move container to workspace ${ws1}";
      "${modifier}+Shift+2" = "move container to workspace ${ws2}";
      "${modifier}+Shift+3" = "move container to workspace ${ws3}";
      "${modifier}+Shift+4" = "move container to workspace ${ws4}";
      "${modifier}+Shift+5" = "move container to workspace ${ws5}";
      "${modifier}+Shift+6" = "move container to workspace ${ws6}";
      "${modifier}+Shift+7" = "move container to workspace ${ws7}";
      "${modifier}+Shift+8" = "move container to workspace ${ws8}";
      "${modifier}+Shift+9" = "move container to workspace ${ws9}";
      "${modifier}+Shift+0" = "move container to workspace ${ws0}";

      "${modifier}+b" = "split h";
      "${modifier}+v" = "split v";

      "${modifier}+h" = "focus left";
      "${modifier}+j" = "focus down";
      "${modifier}+k" = "focus up";
      "${modifier}+l" = "focus right";

      "${modifier}+Shift+h" = "move left";
      "${modifier}+Shift+j" = "move down";
      "${modifier}+Shift+k" = "move up";
      "${modifier}+Shift+l" = "move right";

      # Lock
      "${modifier}+x" = ''
        exec ${pkgs.i3lock-fancy}/bin/i3lock-fancy -p -t "System Locked Down"'';

      # Screenshot
      "${modifier}+o" = "exec ${pkgs.flameshot}/bin/flameshot gui";
    };
    startup = [
      {
        command = "${pkgs.autorandr}/bin/autorandr -c&";
        always = true;
        notification = false;
      }
      {
        command = "${pkgs.nitrogen}/bin/nitrogen --restore &";
        always = true;
        notification = false;
      }
      {
        command = "${pkgs.i3-gaps}/bin/i3-msg workspace ${ws1}";
        always = true;
      }
      {
        command = "systemctl --user restart polybar";
        always = true;
      }
    ];

  };

}
