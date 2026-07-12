{pkgs, ...}:{
  fonts.fontconfig.enable = true;
  home.packages = with pkgs;[
    jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
    nerd-fonts.noto
    nerd-fonts.hack
    nerd-fonts.iosevka
  ];
}
