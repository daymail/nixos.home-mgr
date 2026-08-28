{pkgs, ...}:{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    withRuby = false;
    withPython3 = false;
    withNodeJs = false;
    extraPackages = with pkgs;[
      gcc gnumake clang
      nixd nixfmt
      cargo
    ];
  };
  xdg.configFile."nvim".source = ./.;
  home.packages = with pkgs;[
    lua-language-server
    ripgrep
    fd
    git
  ];
}

#LINK: https://nix-community.github.io/home-manager/options/home-manager/programs/neovim.html

