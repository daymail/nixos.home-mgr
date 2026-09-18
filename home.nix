{pkgs, ... }:{
  home.username = "src";
  home.homeDirectory = "/home/src";
  nixpkgs.config.allowUnfree = true;
  home.stateVersion = "25.11"; # Please read the comment before changing.
  imports = [./modules/users/src/main.nix];
  home.packages = with pkgs; [
    fzf
    zip unzip
    git-repo
    grim slurp
    lazygit
    nix-output-monitor
    nvd
    ripgrep
    tty-clock tty-solitaire
    # mtpfs simple-mtpfs fuse jmtpfs libmtp
    pcmanfm
    prismlauncher
    mpv

    firefoxpwa
    discord-ptb
    steam
  ];
  home.file = {
  };
  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "zen-twilight";
  };

  programs.home-manager.enable = true;
}
