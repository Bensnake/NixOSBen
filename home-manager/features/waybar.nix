{pkgs, config, ...}:

{
    programs.waybar = {
    enable = true;
    settings = {
        mainBar = {
            layer = "top";
            height = 30;
            spacing = 4;
            modules-left = ["hyprland/workspaces" "hyprland/submap"];
            modules-center = ["hyprland/window"];
            modules-right = ["idle_inhibitor" "pulseaudio" "network" "backlight" "keyboard-state" "hyprland/language" "battery" "battery#bat2" "clock#date" "clock" "tray" "custom/power" "custom/notification"];
            keyboard-state = {
                numlock = true;
                capslock = true;
                format = "{name} {icon}";
                format-icons = {
                    locked = "";
                    unlocked = "";
                };
            };
            "hyprland/submap" = {
                format = "<span style=\"italic\">{}</span>";
            };
            "hyprland/scratchpad" = {
                format = "{icon} {count}";
                show-empty = false;
                format-icons = ["" ""];
                tooltip = true;
                tooltip-format = "{app}: {title}";
            };
            "idle_inhibitor" = {
                format = "{icon}";
                format-icons = {
                    activated = "";
                    deactivated = "";
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
            };
            "clock#date" = {
                format = "{:%a %d %b}";
                tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
            };
            "cpu" = {
                format = "{usage}% ";
                tooltip = false;
            };
            "memory" = {
                format = "{}% ";
            };
            "temperature" = {
                # thermal-zone = 2;
                # hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
                critical-threshold = 80;
                # format-critical = "{temperatureC}°C {icon}";
                format = "{temperatureC}°C {icon}";
                format-icons = ["" "" ""];
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
                format-charging = "{capacity}% ";
                format-plugged = "{capacity}% ";
                format-alt = "{time} {icon}";
                # format-good = ""; # An empty format will hide the module
                # format-full = "";
                format-icons = ["" "" "" "" ""];
            };
            "battery#bat2" = {
                bat = "BAT2";
            };
            "network" = {
                # "interface" = "wlp2*"; # (Optional) To force the use of this interface
                format-wifi = "{essid} ({signalStrength}%) ";
                format-ethernet = "󰈀";
                tooltip-format = "{ifname} via {gwaddr} ";
                format-linked = "{ifname} (No IP) ";
                format-disconnected = "Disconnected ⚠";
                format-alt = "{ifname}: {ipaddr}/{cidr}";
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
                format = "⏻";
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
            font-family: FontAwesome, Roboto, Helvetica, Arial, sans-serif;
            font-size: 13px;
        }

        window#waybar {
            background-color: #${config.colorScheme.colors.base00};
            border-bottom: 3px solid #${config.colorScheme.colors.base03};
            color: #${config.colorScheme.colors.base05};
            transition-property: background-color;
            transition-duration: .5s;
        }

        window#waybar.hidden {
            opacity: 0.2;
        }

        window#waybar.termite {
            background-color: #3F3F3F;
        }

        window#waybar.chromium {
            background-color: #000000;
            border: none;
        }

        button {
            /* Use box-shadow instead of border so the text isn't offset */
            box-shadow: inset 0 -3px transparent;
            /* Avoid rounded borders under each button name */
            border: none;
            border-radius: 0;
        }

        button:hover {
            background: inherit;
            box-shadow: inset 0 -3px #${config.colorScheme.colors.base05};
        }

        #workspaces button {
            padding: 0 5px;
            background-color: transparent;
            color: #${config.colorScheme.colors.base05};
        }

        #workspaces button:hover {
            background: rgba(0, 0, 0, 0.2);
        }

        #workspaces button.active {
            background-color: #${config.colorScheme.colors.base03};
            box-shadow: inset 0 -3px #${config.colorScheme.colors.base05};
        }

        #workspaces button.urgent {
            background-color: #${config.colorScheme.colors.base08};
        }

        #submap {
            background-color: #64727D;
            border-bottom: 3px solid #${config.colorScheme.colors.base05};
        }

        #keyboard-state,
        #pulseaudio,
        #language,
        #custom-notification,
        #custom-power,
        #clock,
        #battery,
        #cpu,
        #memory,
        #disk,
        #temperature,
        #backlight,
        #network,
        #wireplumber,
        #custom-media,
        #tray,
        #submap,
        #idle_inhibitor,
        #scratchpad,
        #mpd {
            color: #${config.colorScheme.colors.base05};
            padding: 0px 8px;
        }

        #window,
        #workspaces {
            margin: 0 4px;
        }

        /* If workspaces is the leftmost module, omit left margin */
        .modules-left > widget:first-child > #workspaces {
            margin-left: 0;
        }

        /* If workspaces is the rightmost module, omit right margin */
        .modules-right > widget:last-child > #workspaces {
            margin-right: 0;
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
            padding: 0 8px;
        }

        #keyboard-state > label.locked {
            color: #${config.colorScheme.colors.base08};
        }

        #scratchpad {
            background: rgba(0, 0, 0, 0.2);
        }

        #scratchpad.empty {
            background-color: transparent;
        }
        '';
    };
}
