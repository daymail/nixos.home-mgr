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
      default-bg = "#181818"; # c0 (Main background)
      default-fg = "#D0D9D7"; # c5 (Main foreground)

      statusbar-bg = "#3D3D3D"; # c2 (Matching Neovim's CursorLine/Visual)
      statusbar-fg = "#D0D9D7"; # c5 (Main text)

      inputbar-bg = "#181818";  # c0
      inputbar-fg = "#D0D9D7";  # c5

      notification-bg = "#181818"; # c0
      notification-fg = "#D0D9D7"; # c5
      notification-error-bg = "#CE96A6"; # c11 (Pastel Red for errors)
      notification-error-fg = "#181818"; # c0 (Dark text for contrast)
      notification-warning-bg = "#F5CCD4"; # c15 (Pastel Yellow for warnings)
      notification-warning-fg = "#181818"; # c0 (Dark text for contrast)

      completion-bg = "#3D3D3D"; # c2 (Inactive background)
      completion-fg = "#D0D9D7"; # c5 (Inactive text)
      completion-highlight-bg = "#90E0F3"; # c8 (Cyan for active selection)
      completion-highlight-fg = "#181818"; # c0 (Dark text on active selection)
      completion-group-bg = "#3D3D3D"; # c2 (Group header background)
      completion-group-fg = "#95D5B2"; # c7 (Green for group header text)

      highlight-color = "#F5CCD4"; # c15 (Yellow for general search results)
      highlight-active-color = "#E0CEFD"; # c13 (Magenta for currently active search result)

      recolor-lightcolor = "#181818"; # c0 (Page background)
      recolor-darkcolor = "#D0D9D7"; # c5 (Document text and lines)
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
