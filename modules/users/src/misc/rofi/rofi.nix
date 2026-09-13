{pkgs, ... }:{
  home.packages = [
    pkgs.rofi
  ];

  xdg.configFile."rofi/config.rasi".text = ''
    configuration {
        modi:                       "drun,run,filebrowser,window";
        show-icons:                 true;
        display-drun:               "";
        display-run:                "";
        display-filebrowser:        "";
        display-window:             "";
        drun-display-format:        "{name}";
        window-format:              "{w} · {c} · {t}";
    }
    @theme "/dev/null"
    * {
        font:                        "JetBrains Mono Nerd Font 10";
        background:                  #181818f2;
        background-alt:              #1A1A1A;
        foreground:                  #D0D9D7;
        selected:                    #aac0b3;
        active:                      #B4E1EB;
        urgent:                      #CE96A6;
        app-selected:                #aac0b3;
        scroll:                      #3D3D3D;
    }

    window {
        transparency:                "real";
        location:                    center;
        anchor:                      center;
        fullscreen:                  false;
        width:                       900px;
        x-offset:                    0px;
        y-offset:                    0px;
        border:                      0;
        enabled:                     true;
        border-radius:               30px 30px 30px 30px;
        cursor:                      "idefault";
        background-color:            @background;
    }

    mainbox {
        enabled:                     true;
        spacing:                     0px;
        opacity:                     0;
        background-color:            transparent;
        orientation:                 vertical;
        children:                    [ "inputbar", "listbox" ];
    }

    listbox {
        spacing:                     1px;
        padding:                     20px;
        background-color:            transparent;
        orientation:                 vertical;
        children:                    [ "message", "listview" ];
    }

    inputbar {
        enabled:                     true;
        spacing:                     10px;
        padding:                     10px 6px 0px;
        background-color:            transparent;
        text-color:                  @foreground;
        orientation:                 horizontal;
        children:                    [ "textbox-prompt-colon", "entry", "dummy", "mode-switcher" ];
    }
    textbox-prompt-colon {
        enabled:                     true;
        expand:                      false;
        str:                         "";
        padding:                     12px 15px;
        border-radius:               15px 15px 15px 15px;
        background-color:            @background-alt;
        text-color:                  inherit;
    }
    entry {
        enabled:                     true;
        expand:                      false;
        width:                       250px;
        padding:                     12px 16px;
        border-radius:               15px 15px 15px 15px;
        background-color:            @background-alt;
        text-color:                  inherit;
        cursor:                      text;
        placeholder:                 "Search";
        placeholder-color:           inherit;
    }
    dummy {
        expand:                      true;
        background-color:            transparent;
    }

    mode-switcher{
        enabled:                     true;
        spacing:                     30px;
        background-color:            transparent;
        text-color:                  @foreground;
    }
    button {
        width:                       45px;
        padding:                     12px;
        border-radius:               15px 15px 15px 15px;
        background-color:            @background-alt;
        text-color:                  inherit;
        cursor:                      pointer;
    }
    button selected {
        background-color:            @app-selected;
        text-color:                  #181818;
    }

    listview {
        enabled:                     true;
        columns:                     2;
        lines:                       7;
        cycle:                       true;
        dynamic:                     true;
        scrollbar:                   true;
        layout:                      vertical;
        reverse:                     false;
        fixed-height:                true;
        row-padding:                 2px;
        fixed-columns:               true;
        spacing:                     2px;
        background-color:            transparent;
        text-color:                  @foreground;
        cursor:                      "default";
    }

    element {
        enabled:                     true;
        margin:                      0px;
        spacing:                     2px;
        padding:                     12px;
        border-radius:               20px 20px 20px 20px;
        background-color:            transparent;
        text-color:                  @foreground;
        cursor:                      pointer;
    }
    element normal.normal {
        background-color:            inherit;
        text-color:                  inherit;
    }
    element normal.urgent {
        background-color:            @urgent;
        text-color:                  #181818;
    }
    element normal.active {
        background-color:            @active;
        text-color:                  #181818;
    }
    element selected.normal {
        background-color:            @app-selected;
        text-color:                  #181818;
    }
    element selected.urgent {
        background-color:            @urgent;
        text-color:                  #181818;
    }
    element selected.active {
        background-color:            @urgent;
        text-color:                  #181818;
    }
    element-icon {
        background-color:            transparent;
        text-color:                  inherit;
        size:                        32px;
        cursor:                      inherit;
    }
    element-text {
        background-color:            transparent;
        text-color:                  inherit;
        cursor:                      inherit;
        vertical-align:              0.5;
        horizontal-align:            0.0;
    }
    scrollbar{
        width: 4px;
        handle-color: @scroll;
        handle-rounded-corners: true;
        handle-width: 10px;
        border-radius: 20px 20px 20px 20px;
        background-color: @background-alt;
    }
    message {
        background-color:            transparent;
    }
    textbox {
        padding:                     12px;
        border-radius:               15px 5px 15px 5px;
        background-color:            @background-alt;
        text-color:                  @foreground;
        vertical-align:              0.5;
        horizontal-align:            0.0;
    }
    error-message {
        padding:                     12px;
        border-radius:               0px;
        background-color:            @background;
        text-color:                  @foreground;
    }
  '';

  xdg.configFile."rofi/theme.rasi".text = ''
    @import "config.rasi"

    configuration{
        show-icons: false;
    }
    window {
        width: 310px;
        height: 390px;
    }

    entry{
        placeholder: "Themes";
    }

    listview {
        columns: 1;
        lines: 0;
        fixed-height: false;
        scrollbar: false;
    }

    listbox{
        padding: 15px;
    }

    inputbar {
        children: [ "textbox-prompt-colon", "entry" ];
    }

    element{
        border-radius: 15px;
    }
  '';
}
