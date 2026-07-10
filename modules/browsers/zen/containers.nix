{...}:{
  programs.zen-browser.profiles.default ={
    containersForce = true;
    containers = {
      Personal ={
        id = 1;
        color = "purple";
        icon = "fingerprint";
      };
      Work = {
        id = 2;
        color = "blue";
        icon = "briefcase";
      };
      Dev = {
        id = 3;
        color = "red";
        icon = "chill";
      };
    };
  };
}
