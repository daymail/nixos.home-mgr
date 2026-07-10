{pkgs, ...}:{
  programs.zen-browser.profiles.default.search = {
    force = true;
    default = "ddg"; #DuckDuckGO
    engines = {
      nixos = {
        name = "NIX-OS";
        urls= [
          {
            template = "https://mynixos.com/search?q={searchTerms}";
            params = [{name = "query"; value = "searchTerms";}];
          }
        ];
        icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
        definedAliases = ["@nix"];
      };

      github = {
        name = "Github";
        urls = [{template = "https://github.com/search?q={searchTerms}";}];
        icon = ../../../assets/github-face.svg;
        definedAliases = ["@gh"];
      };

      youtube = {
        name = "Youtube";
        urls = [{template = "https://www.youtube.com/results?search_query={searchTerms}";}];
        icon = ../../../assets/youtube-black.svg;
        definedAliases = ["@yt"];
      };

      firefox-addons = {
        name = "Firefox Addons";
        urls = [{template = "https://addons.mozilla.org/en-US/firefox/search/?q={searchTerms}";}];
        icon = ../../../assets/firefox-addons.svg;
        definedAliases = ["@ffa"]; #firefox addons
      };

      cppreference = {
        name = "Cppreference";
        urls = [{template = "https://en.cppreference.com/mwiki/index.php?search={searchTerms}";}];
        icon = ../../../assets/cpp.svg;
        definedAliases = ["@cpp"];
      };

      stackoverflow = {
        name = "StackOverflow";
        urls = [{template = "https://stackoverflow.com/search?q={searchTerms}";}];
        icon = ../../../assets/stackoverflow.svg;
        definedAliases = ["@so"];
      };

      wikipedia = {
        name = "wikipedia";
        urls = [{template = "https://en.wikipedia.org/wiki/Special:Search?search={searchTerms}";}];
        icon =  ../../../assets/wikipedia-logo.svg;
        definedAliases = ["@wp"];
      };
    };
  };
}

#PRESS Ctrl + l
