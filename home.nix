{ config, pkgs, ... }:

{
    programs.home-manager.enable = true;

    home = {
        username = "floride";
        homeDirectory = "/home/floride";

        stateVersion = "21.11";
    };
}
