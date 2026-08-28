{pkgs, ...}:{
  programs.fish ={
    enable = true;
    interactiveShellInit = builtins.readFile ./config.fish;
    plugins = [
      {name = "fzf-fish"; src = pkgs.fishPlugins.fzf-fish.src;}
      {name = "sponge"; src = pkgs.fishPlugins.sponge.src;}
    ];

    functions = {
      ninfo = {
        description = "Read info pages in Neovim";
        body = ''
          set -l target (string join " " $argv)
          nvim -R -M -c "Info $target" +only
        '';
      };
    };
  };

  programs.nix-your-shell = {
    enable = true;
    enableFishIntegration = true;
  };
  xdg.configFile = {
    "fish/conf.d" = {
      source = ./conf.d;
      recursive = true;
    };
    "fish/functions" = {
      source = ./functions;
      recursive = true;
    };
  };
}
