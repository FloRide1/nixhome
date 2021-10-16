{ config, pkgs, ... }:

let 
    defaultPkgs = with pkgs; [
        
    ];

    shellPkgs = with pkgs; [
        # Font
        meslo-lgs-nf

        # Shell
        any-nix-shell

        # Utility
        htop
        cheat
        neofetch
        lsd
        bat
        delta
    ];

in
{
    programs.home-manager.enable = true;

    home = {
        username = "floride";
        homeDirectory = "/home/floride";

        packages = defaultPkgs ++ shellPkgs;
        stateVersion = "21.11";
    };

    home.keyboard = {
        layout = "gb";
    };

    imports = [

    ];
}
