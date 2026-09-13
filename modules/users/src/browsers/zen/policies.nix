{
  programs.zen-browser.policies = {
    AutofillAddressEnabled = true;
    DisableAppUpdate = true;
    DisableTelementry = true;
    DontCheckDefaultBrowser = true;
    AutofillCreditCardEnabled = false;
    DisableSafeMode = true;
    OfferToSaveLogins = false;
    EnableTrackingProtection = {
      Value = true;
      Locked = true;
      Cryptomining = true;
      #EmailTracking = true;
      Fingerprinting = true;
      SuspectedFingerprinting = true;
    };
  };
}
