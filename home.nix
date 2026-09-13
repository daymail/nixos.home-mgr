{pkgs, ... }:{
  home.username = "src";
  home.homeDirectory = "/home/src";
  home.stateVersion = "25.11"; # Please read the comment before changing.
  imports = [./modules/users/src/main.nix];
  home.packages = with pkgs; [
    fzf
    zip unzip
    firefoxpwa
    lazygit
    ripgrep
    tty-clock tty-solitaire
    # mtpfs simple-mtpfs fuse jmtpfs libmtp
  ];
  home.file = {
  };
  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "zen-twilight";
  };

  programs.home-manager.enable = true;
}
