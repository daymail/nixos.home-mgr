{
  programs.zen-browser.profiles.default = {
    settings = {
      "browser.startup.homepage" = "https://google.com";
      "privacy.donottrackheader.enabled" = true;
      "ui.systemUsesDarkTheme" = 1;
      "layout.css.prefers-color-scheme.content-override" = 0;
      "browser.theme.content-theme" = 0;
      "browser.theme.toolbar-theme" = 0;
      "zen.workspaces.continue-where-left-off" = true;
      "zen.view.compact.hide-tabbar" = true;
      "zen.urlbar.behavior" = "floating-on-type";
      "zen.welcome-screen.seen" = true;
      "layout.css.devPixelsPerPx" = "0.9"; #Browser scale
    };
  };
  imports = [./browser-font.nix];
}
