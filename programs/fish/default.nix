{ pkgs, ... }:

{
  programs.fish = {
    enable = true;

    plugins = [
      {
        name = "tide";
        src = pkgs.fishPlugins.tide.src;
      }

      {
        name = "sponge";
        src = pkgs.fishPlugins.sponge.src;
      }

      {
        name = "grc";
        src = pkgs.fishPlugins.grc.src;
      }

      {
        name = "colored-man-pages";
        src = pkgs.fishPlugins.colored-man-pages.src;
      }

    ];

    shellAliases = {
      v = "nvim";
      c = "clear";
      untar = "tar -xvzf";
      tarc = "tar -cvzf";
      mkdir = "mkdir -vp";
      rm = "rm -riv";
      cp = "cp -riv";
      mv = "mv -iv";
      cat = "bat -p";
      ls = "lsd";
      sl = "lsd";
      tree = "lsd --tree";
    };
  };
}
