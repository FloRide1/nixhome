{ pkgs, ... }:

{
    programs.alacritty = {
        enable = true;

        settings = {
            # env.TERM = "xterm-256color";
            # live_config_reload = true;

            font = {
                normal.family = "MesloLGS Nerd Font";
                normal.style = "Regular";
                size = 10.0;
            };

            shell = {
                program = "${pkgs.fish}/bin/fish";
                args = [ "--init-command" "echo; neofetch; echo" ];
            };

            colors = {
                primary = {
                    background = "#212121";
                    foreground = "#F1F1F1";
                };
                normal = {
                    black=   "0x212121";
                    red=     "0xC30771";
                    green=   "0x10A778";
                    yellow=  "0xA89C14";
                    blue=    "0x008EC4";
                    magenta= "0x523C79";
                    cyan=    "0x20A5BA";
                    white=   "0xE0E0E0";
                };
                bright = {
                    black=   "0x818181";
                    red=     "0xFB007A";
                    green=   "0x5FD7AF";
                    yellow=  "0xF3e430";
                    blue=    "0x20BBFC";
                    magenta= "0x6855DE";
                    cyan=    "0x4FB8CC";
                    white=   "0xF1F1F1";
                };
            };
        };
    };
}
