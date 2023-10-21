{config, pkgs, ...}:

{
  programs.wlogout = {
    enable = true;
    style = ''
      window {
          background-color: rgba(0, 0, 0, 0.2);
      }
      button {
          color: #${config.colorScheme.colors.base05};
          background-color: #${config.colorScheme.colors.base00};
          /* border-style: solid;
          border-width: 2px; */
          background-repeat: no-repeat;
          background-position: center;
          background-size: 25%;
      }

      button:focus, button:active, button:hover {
          background-color: #${config.colorScheme.colors.base03};
      }

      #lock {
          background-image: image(url("/home/ben/.config/home-manager/features/wlogout/icons/lock.png"));
      }

      #logout {
          background-image: image(url("/home/ben/.config/home-manager/features/wlogout/icons/logout.png"));
      }

      #suspend {
          background-image: image(url("/home/ben/.config/home-manager/features/wlogout/icons/suspend.png"));
      }

      #hibernate {
          background-image: image(url("/home/ben/.config/home-manager/features/wlogout/icons/hibernate.png"));
      }

      #shutdown {
          background-image: image(url("/home/ben/.config/home-manager/features/wlogout/icons/shutdown.png"));
      }

      #reboot {
          background-image: image(url("/home/ben/.config/home-manager/features/wlogout/icons/reboot.png"));
      }
    '';
  };
}
