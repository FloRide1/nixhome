{ lib, pkgs, config, ... }:

let home_path = "/home/floride";
in { services.syncthing = { enable = true; }; }
