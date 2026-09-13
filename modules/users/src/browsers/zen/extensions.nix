{...}:{
  programs.zen-browser.policies = let
    mkExtensionSettings = builtins.mapAttrs(_: val:
    let
      defaults = {allowPrivate = false; pinned = false;};
      cfg = if builtins.isAttrs val then defaults // val else defaults // {id = val;};
    in{
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/${cfg.id}/latest.xpi";
      installation_mode = "force_installed";
      private_browsing = cfg.allowPrivate;
      default_area = if cfg.pinned then "navbar" else "menupanel";
    });
  in{
    ExtensionSettings = mkExtensionSettings{
    # "Extension-ID" = "url-slug-on-amo"
      "uBlock0@raymondhill.net" = {id = "ublock-origin"; allowPrivate = true; pinned = false;}; #UBLOCK-ORIGIN
      "addon@darkreader.org" = {id = "darkreader"; allowPrivate = true; pinned = false;}; #DARKREADER
      "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}" = {id = "styl-us"; allowPrivate = true; pinned = false;}; #STYLUS
      "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {id = "vimium-ff"; allowPrivate = true; pinned = false;}; #VIMIUM
      "{74145f27-f039-47ce-a470-a662b129930a}" = {id = "clearurls"; allowPrivate = true; pinned = false;}; #CLEARURLS
      "jid1-BoFifL9Vbdl2zQ@jetpack" = {id = "decentraleyes"; allowPrivate = true; pinned = false;}; #DECENTRALEYES
      "firefoxpwa@filips.si" = {id = "pwas-for-firefox"; allowPrivate = true; pinned = true;};
    };
  };
}




# Extension-ID - install the extension manually in ZEN, then goto [about:debugging#/runtime/this-firefox] and look at the Extension ID string.
# url-slug-on-amo - search the extension in [https://addons.mozilla.org/] and the 'url-slug' at the end is it.
