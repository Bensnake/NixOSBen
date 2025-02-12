{pkgs, config, ...}:

{
    programs.waybar = {
    enable = true;
    settings = {
        mainBar = {
            layer = "top";
            height = 30;
            spacing = 4;
            modules-left = ["custom/power" "clock" "hyprland/workspaces"];
            modules-center = ["hyprland/window"];
            modules-right = ["idle_inhibitor" "tray" "pulseaudio" "battery" "battery#bat2" "backlight" "keyboard-state" "hyprland/language" "custom/notification"];
            keyboard-state = {
                numlock = true;
                capslock = true;
                format = "{name} {icon}";
                format-icons = {
                    locked = "";
                    unlocked = "";
                };
            };
            "hyprland/workspaces" = {
                on-scroll-up = "hyprctl dispatch workspace e+1";
                on-scroll-down = "hyprctl dispatch workspace e-1";
            };
            "idle_inhibitor" = {
                format = "{icon}";
                format-icons = {
                    activated = "󰒲";
                    deactivated = "󰒳";
                };
            };
            "tray" = {
                # icon-size = 21;
                spacing = 10;
            };
            "clock" = {
                # timezone = "America/New_York";
                # tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
                # format-alt = "{:%Y-%m-%d}";
                format-alt = "{:%a %d %b}";
            };
            "backlight" = {
                # device = "acpi_video1";
                format = "{percent}% {icon}";
                format-icons = ["" "" "" "" "" "" "" "" ""];
            };
            "battery" = {
                states = {
                    # good = 95;
                    warning = 30;
                    critical = 15;
                };
                format = "{capacity}% {icon}";
                format-charging = "{capacity}% 󰂉";
                format-plugged = "{capacity}% ";
                format-alt = "{time} {icon}";
                # format-good = ""; # An empty format will hide the module
                # f -full = "";
                format-icons = ["󰂎" "󰁼" "󰁾" "󰂀" "󰁹"];
            };
            "battery#bat2" = {
                bat = "BAT2";
            };
            "pulseaudio" = {
                # scroll-step = 1; # %, can be a float
                format = "{volume}% {icon} {format_source}";
                format-bluetooth = "{volume}% {icon} {format_source}";
                format-bluetooth-muted = " {icon} {format_source}";
                format-muted = " {format_source}";
                format-source = "";
                format-source-muted = "";
                format-icons = {
                    headphone = "";
                    hands-free = "󰋎";
                    headset = "󰋎";
                    phone = "";
                    portable = "";
                    car = "";
                    default = ["" "" ""];
                };
                on-click = "pavucontrol";
            };
            "custom/power" = {
                format = "";
                tooltip = false;
                on-click = "wlogout";
            };
            "custom/notification" = {
                tooltip = false;
                format = "{} {icon}";
                format-icons = {
                  notification = "<span foreground='red'><sup></sup></span>";
                  none = "";
                  dnd-notification = "<span foreground='red'><sup></sup></span>";
                  dnd-none = "";
                  inhibited-notification = "<span foreground='red'><sup></sup></span>";
                  inhibited-none = "";
                  dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
                  dnd-inhibited-none = "";
                };
                return-type = "json";
                exec-if = "which swaync-client";
                exec = "swaync-client -swb";
                on-click = "sleep 0.1; swaync-client -t -sw";
                on-click-right = "swaync-client -d -sw";
                escape = true;
            };
        };
    };
    style = ''
        * {
            /* `otf-font-awesome` is required to be installed for icons */
            font-family: JetBrainsMono Nerd Font;
            font-size: 13px;
        }

        window#waybar {
            background-color: rgba(0,0,0,0.8);
            color: #${config.colorScheme.colors.base05};
            transition-property: background-color;
            transition-duration: .5s;
        }

        #workspaces button {
            color: #${config.colorScheme.colors.base05};
            background-color: rgba(0,0,0,0.8);
            border-radius: 8px;
            margin-top: 8px;
            margin-bottom: 8px;
            margin-right: 1px;
            margin-left: 1px;
        }

        #workspaces button.active {
            color: #${config.colorScheme.colors.base01};
            background: linear-gradient(45deg, #${config.colorScheme.colors.base08}, #${config.colorScheme.colors.base09});
        }

        #workspaces button.urgent {
            color: #${config.colorScheme.colors.base08};
        }

        #keyboard-state,
        #pulseaudio,
        #language,
        #custom-notification,
        #custom-power,
        #clock,
        #battery,
        #backlight,
        #tray,
        #idle_inhibitor {
            color: #${config.colorScheme.colors.base05};
            background-color: transparent;
            border-radius: 8px;
            padding: 5px 15px;
            margin-top: 8px;
            margin-bottom: 8px;
            margin-right: 2px;
            margin-left: 2px;
        }

        #custom-power {
            color: #${config.colorScheme.colors.base0D};
        }


        @keyframes blink {
            to {
                background-color: #${config.colorScheme.colors.base05};
                color: #000000;
            }
        }

        #battery.critical:not(.charging) {
            background-color: #f53c3c;
            color: #${config.colorScheme.colors.base05};
            animation-name: blink;
            animation-duration: 0.5s;
            animation-timing-function: linear;
            animation-iteration-count: infinite;
            animation-direction: alternate;
        }

        label:focus {
            background-color: #000000;
        }

        #tray > .passive {
            -gtk-icon-effect: dim;
        }

        #tray > .needs-attention {
            -gtk-icon-effect: highlight;
            background-color: #eb4d4b;
        }

        #idle_inhibitor.activated {
            color: #${config.colorScheme.colors.base08};
        }

        #keyboard-state > label {
            padding: 0 6px;
        }

        #keyboard-state > label.locked {
            color: #${config.colorScheme.colors.base08};
        }
        '';
    };
}
