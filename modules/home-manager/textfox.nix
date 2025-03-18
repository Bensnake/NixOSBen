{inputs, pkgs, config, ...}:

{
  textfox = {
      enable = true;
      profile = "default";
      config = {
        border = {
          width = "2px";
          transition = "1.0s ease";
          radius = "2px";
        };
        tabs = {
          vertical = {
            enable = true;
          };
        };
        icons = {
          toolbar.extensions.enable = true;
          context.extensions.enable = true;
        };
        displayWindowControls = false;
        displayNavButtons = true;
        displayUrlbarIcons = true;
        displaySidebarTools = true;
        displayTitles = true;
        font = { 
          family = "Roboto";
        };
  };
  };
}
