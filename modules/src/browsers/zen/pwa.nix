{pkgs, config, lib, ...}:
let
  pwaSites = [
    {
      id = "018f3a2b-soundcloud";
      name = "SoundCloud";
      url = "https://soundcloud.com";
      icon = "soundcloud"; # System icon name or path
      comment = "Audio & Music Streaming";
    }
    {
      id = "018f3a2b-youtube";
      name = "YouTube";
      url = "https://youtube.com";
      icon = "youtube";
      comment = "Video Streaming";
    }
  ];
  mkPwaConfig = site: {
    name = "pwa/${site.id}/config.json";
    value = {
      text = builtins.toJSON {
        id = site.id;
        name = site.name;
        url = site.url;
        launch_url = site.url;
        isolated = true;
        profile = "default";
      };
    };
  };

  mkDesktopEntry = site: {
    name = "pwa-${site.id}";
    value = {
      name = site.name;
      genericName = "Web Application";
      comment = site.comment;
      exec = "${pkgs.firefoxpwa}/bin/firefoxpwa site launch ${site.id}";
      icon = site.icon;
      terminal = false;
      categories = [ "Network" "X-WebApplication" ];
    };
  };
in{
  home.packages = [pkgs.firefoxpwa];
  xdg.dataFile = builtins.listToAttrs (map mkPwaConfig pwaSites);
  xdg.desktopEntries = builtins.listToAttrs (map mkDesktopEntry pwaSites);
}
