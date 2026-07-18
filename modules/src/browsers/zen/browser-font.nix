{
  programs.zen-browser.profiles.default = {
    settings = {
      "browser.display.use_document_fonts" = 0;
      "font.name.monospace.x-western" = "Iosevka Nerd Font";
      "font.name.sans-serif.x-western" = "Iosevka Nerd Font";
      "font.name.serif.x-western" = "Iosevka Nerd Font";
      "font.default.x-western" = "sans-serif";
    };

    userChrome = ''
      /* Force Iosevka on the UI, status bars, sidebars, and tab titles */
        *, *::before, *::after {
          font-family: "Iosevka Nerd Font" !important;
        }
    '';

    userContent = ''
        *, *::before, *::after {
          font-family: "Iosevka Nerd Font" !important;
        }
      '';
  };
}
