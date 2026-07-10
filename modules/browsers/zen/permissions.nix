{...}:{
  programs.zen-browser.policies.Permissions = {
    Camera = {
      Allow = [];
      BlockNewRequests = true;
      Locked = true;
    };
    Microphone = {
      Allow = [];
      Block = [];
      BlockNewRequests = false;
      Locked = true;
    };
    Location = {
      Allow = [];
      BlockNewRequests = false;
      Locked = true;
    };
    Notifications = {
      Allow = [];
      BlockNewRequests = true;
      Locked = true;
    };
    Autoplay = {
      Allow = [];
      Default = "block-audio-video";
      Locked = true;
    };
    ScreenShare = {
      Allow = ["https://discord.com" "https://meet.google.com"];
      BlockNewRequests = true;
      Locked = true;
    };
  };
}
