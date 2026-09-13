{...}:{
  programs.zen-browser.policies = {
    Preferences = {
      "browser.startup.homepage" = {
        Value = "about:blank";
        Status = "locked";
      };
      "browser.tabs.warnOnClose" = {
        Value = false;
        Status = "locked";
      };
      "privacy.fingerprintingProtection" = {
        Value = true;
        Status = "locked";
      };
    };
  };
}
