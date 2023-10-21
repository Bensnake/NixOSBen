{config, pkgs, ...}:

{
  services.swayidle = {
      enable = true;
      systemdTarget = "hyprland-session.target";
      events = [
        #{
        #  event = "before-sleep";
        #  command = "${pkgs.swaylock-effects}/bin/swaylock";
        #}
        #{
        #  event = "lock";
        #  command = "${pkgs.swaylock-effects}/bin/swaylock";
        #}
      ];
      timeouts = [
        {
          timeout = 180;
          command = "${pkgs.swaylock-effects}/bin/swaylock";
        }
      ];
    };
}
