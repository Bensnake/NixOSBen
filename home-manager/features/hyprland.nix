{pkgs, config, ...}:

{
  wayland.windowManager.hyprland = {
  enable = true;
  enableNvidiaPatches = true;
  xwayland.enable = true;
  settings = {
      monitor = ",preferred,auto,auto,bitdepth,10";

      env = [
          "XCURSOR_SIZE,24"
          # nvidia environment variables
          "LIBVA_DRIVER_NAME,nvidia"
          "XDG_SESSION_TYPE,wayland"
          "GBM_BACKEND,nvidia-drm"
          "__GLX_VENDOR_LIBRARY_NAME,nvidia"
          "WLR_NO_HARDWARE_CURSORS,1"
      ];

      exec-once = [
      "waybar & nm-applet --indicator & hyprpaper & blueman-applet & swaync & udiskie -f thunar --tray"
      "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      # set  cursor theme
      "hyprctl setcursor Bibata-Original-Ice 24"
      ];

      # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
      input = {
          kb_layout = "us, ara";
          kb_options = "grp:alt_shift_toggle";

          follow_mouse = 1;

          touchpad = {
              natural_scroll = true;
          };

          sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
          accel_profile = "flat";
      };

      general = {
          gaps_in = 3;
          gaps_out = 3;
          border_size = 2;
          "col.active_border" = "rgba(${config.colorScheme.colors.base08}ee) rgba(${config.colorScheme.colors.base09}ee) 45deg";
          "col.inactive_border" = "rgba(595959aa)";

          layout = "dwindle";

          # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
          # allow_tearing = false;
      };

      decoration = {
          rounding = 5;

          blur = {
              enabled = true;
              size = 3;
              passes = 1;
          };

          drop_shadow = true;
          shadow_range = 4;
          shadow_render_power = 3;
          "col.shadow" = "rgba(1a1a1aee)";
      };

      animations = {
          enabled = true;

          # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

          bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

          animation = [
          "windows, 1, 3, myBezier"
          "windowsOut, 1, 3, default, popin 80%"
          "border, 1, 5, default"
          "borderangle, 1, 4, default"
          "fade, 1, 3, default" 
          "workspaces, 1, 3, default"
          ];
      };

      dwindle = {
          # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
          pseudotile = true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
          preserve_split = true; # you probably want this
      };

      master = {
          # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
          new_is_master = true;
      };

      gestures = {
          workspace_swipe = false;
      };

      # Example per-device config
      # See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
      "device:epic-mouse-v1" = {
          sensitivity = -0.5;
      };

      # Example windowrule v1
      # windowrule = float, ^(kitty)$
      # Example windowrule v2
      # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
      # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more

      windowrulev2 = [
      "float, class:^(pavucontrol)$"
      ];

      "$mainMod" = "ALT";

      bind = [
          # applications and shortcuts
          "$mainMod, RETURN, exec, alacritty"
          "$mainMod CTRL, L, exec, swaylock"
          "$mainMod, C, killactive"
          "$mainMod, M, exit"
          "$mainMod, V, togglefloating"
          "$mainMod, F, fullscreen"
          "$mainMod, P, pseudo" # dwindle
          "$mainMod, S, togglesplit" # dwindle
          "$mainMod, O, exec, rofi -show drun -show-icons"
          "$mainMod CTRL, S, exec, grimblast --freeze copy area"
          "$mainMod CTRL, D, exec, thunar"
          "$mainMod CTRL, F, exec, firefox"

          # move focus with mainMod + vim
          "$mainMod, H, movefocus, l"
          "$mainMod, L, movefocus, r"
          "$mainMod, K, movefocus, u"
          "$mainMod, J, movefocus, d"

          # switch workspaces with mainMod + number
          "$mainMod, 1, workspace, 1"
          "$mainMod, 2, workspace, 2"
          "$mainMod, 3, workspace, 3"
          "$mainMod, 4, workspace, 4"
          "$mainMod, 5, workspace, 5"
          "$mainMod, 6, workspace, 6"
          "$mainMod, 7, workspace, 7"
          "$mainMod, 8, workspace, 8"
          "$mainMod, 9, workspace, 9"
          "$mainMod, 0, workspace, 10"

          # move active window to a workspace with mainMod + CTRL + number
          "$mainMod CTRL, 1, movetoworkspace, 1"
          "$mainMod CTRL, 2, movetoworkspace, 2"
          "$mainMod CTRL, 3, movetoworkspace, 3"
          "$mainMod CTRL, 4, movetoworkspace, 4"
          "$mainMod CTRL, 5, movetoworkspace, 5"
          "$mainMod CTRL, 6, movetoworkspace, 6"
          "$mainMod CTRL, 7, movetoworkspace, 7"
          "$mainMod CTRL, 8, movetoworkspace, 8"
          "$mainMod CTRL, 9, movetoworkspace, 9"
          "$mainMod CTRL, 0, movetoworkspace, 10"

          # scroll through existing workspaces with mainMod + scroll
          "$mainMod, mouse_down, workspace, e+1"
          "$mainMod, mouse_up, workspace, e-1"

          # sound binds
          ",XF86AudioPlay, exec, playerctl play-pause"
          ",XF86AudioPause, exec, playerctl play-pause"
          ",XF86AudioNext, exec, playerctl next"
          ",XF86AudioPrev, exec, playerctl previous"
      ];

      binde = [
          # more sound binds
          ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
          ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
          ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];

      bindm = [
          # move and resize windows with mainMod + LMB/RMB
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
      ];

  };
  };
}
