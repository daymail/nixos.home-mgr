{zen-browser, ...}:{
  imports = [
    zen-browser.homeModules.twilight
    ./native-messaging.nix
    ./search-engines.nix
    ./permissions.nix
    ./preferences.nix
    ./extensions.nix
    ./containers.nix
    ./bookmarks.nix
    ./policies.nix
    ./settings.nix
    ./zen-mods.nix
    ./spaces.nix
    # ./pwa.nix
  ];
  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
  };
}
