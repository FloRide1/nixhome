{ pkgs, ... }:

{
  programs.fish = {
    enable = true;

    plugins = [{
      name = "tide";
      src = pkgs.fishPlugins.tide.src;
    }];

    shellAliases = {
      v = "nvim";
      c = "clear";
      unziptar = "tar -xvzf";
      mkdir = "mkdir -vp";
      rm = "rm -riv";
      cp = "cp -riv";
      cat = "bat -p";
      ls = "lsd";
      tree = "lsd --tree";
    };
  };
}
