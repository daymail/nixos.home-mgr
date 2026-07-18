{
  programs.zathura = {
    enable = true;
    options = {
      selection-clipboard = "clipboard";
      recolor = true;
      recolor-keephue = true;
      scroll-step = 50;
      zoom-step = 10;

      font = "Iosevka Nerd Font 11";
      default-bg = "#181818";
      default-fg = "#D0D9D7";

      statusbar-bg = "#3D3D3D";
      statusbar-fg = "#D0D9D7";

      inputbar-bg = "#181818";
      inputbar-fg = "#D0D9D7";

      notification-bg = "#181818";
      notification-fg = "#D0D9D7";
      notification-error-bg = "#CE96A6";
      notification-error-fg = "#181818";
      notification-warning-bg = "#F5CCD4";
      notification-warning-fg = "#181818";

      completion-bg = "#3D3D3D";
      completion-fg = "#D0D9D7";
      completion-highlight-bg = "#90E0F3";
      completion-highlight-fg = "#181818";
      completion-group-bg = "#3D3D3D";
      completion-group-fg = "#95D5B2";

      highlight-color = "#F5CCD4";
      highlight-active-color = "#E0CEFD";

      recolor-lightcolor = "#181818";
      recolor-darkcolor = "#D0D9D7";

      page-padding = 0;
      page-v-padding = 0;
      page-h-padding = 0;
    };

    mappings = {
      "D" = "toggle_page_mode";
      "r" = "reload";
      "R" = "rotate rotate-cw";
      "i" = "zoom in";
      "o" = "zoom out";
    };
  };
}



#Ctrl + r = swap theme
