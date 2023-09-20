{ pkgs, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      # env.TERM = "xterm-256color";
      # live_config_reload = true;

      font = {
        normal = {
          family = "MesloLGS NF";
          style = "Regular";
        };
        bold = {
          family = "MesloLGS NF";
          style = "Bold";
        };
        italic = {
          family = "MesloLGS NF";
          style = "Italic";
        };
        bold_italic = {
          family = "MesloLGS NF";
          style = "Bold Italic";
        };
        size = 10.0;
      };

      shell = {
        program = "${pkgs.fish}/bin/fish";
        # args = [ "--init-command" "echo; neofetch; echo" ];
      };

      colors = {
        primary = {
          background = "0x020221";
          foreground = "0xb4b4b9";
        };

        normal = {
          black = "0x000004";
          red = "0xff3600";
          green = "0x859933";
          yellow = "0xffc552";
          blue = "0x635196";
          magenta = "0xff761a";
          cyan = "0x34bfa4";
          white = "0xb4b4b9";
        };

        bright = {
          black = "0x020221";
          red = "0xff8e78";
          green = "0xb2bc55";
          yellow = "0xffd392";
          blue = "0x99a4bc";
          magenta = "0xffb07b";
          cyan = "0x8bccbf";
          white = "0xf8f8ff";
        };
      };
    };
  };
}
