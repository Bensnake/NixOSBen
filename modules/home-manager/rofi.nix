{config, pkgs, ...}:

{
  programs.rofi = {
    enable = true;
    theme = 
      let
        inherit (config.lib.formats.rasi) mkLiteral;
      in
      {
        "*" = {
          black = mkLiteral     "#000000";
          red = mkLiteral       "#${config.colorScheme.colors.base08}";
          green = mkLiteral     "#${config.colorScheme.colors.base0B}";
          yellow = mkLiteral    "#${config.colorScheme.colors.base0A}";
          blue = mkLiteral      "#${config.colorScheme.colors.base0D}";
          magenta = mkLiteral   "#${config.colorScheme.colors.base0E}";
          cyan = mkLiteral      "#${config.colorScheme.colors.base0C}";
          emphasis = mkLiteral  "#${config.colorScheme.colors.base0F}";
          text = mkLiteral      "#${config.colorScheme.colors.base05}";
          text-alt = mkLiteral  "#${config.colorScheme.colors.base07}";
          fg = mkLiteral        "#${config.colorScheme.colors.base03}";
          bg = mkLiteral        "#${config.colorScheme.colors.base00}";

          spacing = 0;
          background-color = mkLiteral "transparent";

          text-color = mkLiteral "@text";
        };

        "window" = {
            location = mkLiteral "center";
            background-color = mkLiteral "@bg";
            width = mkLiteral "620px";
        };

        "mainbox" = {
          childern = map mkLiteral ["inputbar" "message" "listview"];
        };

        "inputbar" = {
          padding = mkLiteral "10px 10px";
          children = map mkLiteral ["entry" "case-indicator"];
        };

        "prompt" = {
          text-color = mkLiteral "@blue";
        };

        "textbox-prompt-colon" = {
          expand = false;
          str = ":";
          text-color = mkLiteral "@text-alt";
        };

        "entry" = {
          margin = mkLiteral "0px 0px";
        };

        "listview" = {
            padding = mkLiteral "5px 5px";
            spacing = mkLiteral "5px";
            fixed-height = true;
            scrollbar = false;
            lines = 6;
        };

        "element" = {
          padding = mkLiteral "5px";
          text-color = mkLiteral "@text-alt";
          highlight = mkLiteral "bold #${config.colorScheme.colors.base0B}";
          border-radius = mkLiteral "3px";
        };

        "element selected" = {
          background-color = mkLiteral "@emphasis";
          text-color = mkLiteral "@text";
        };

        "element urgent, element selected urgent" = {
          text-color = mkLiteral "@red";
        };

        "element active, element selected active" = {
          text-color = mkLiteral "@magenta";
        };

        "message" = {
          padding = mkLiteral "5px";
          border-radius = mkLiteral "3px";
          background-color = mkLiteral "@emphasis";
          border = mkLiteral "1px";
          border-color = mkLiteral "@cyan";
        };

        "button selected" = {
          padding = mkLiteral "5px";
          border-radius = mkLiteral "3px";
          background-color = mkLiteral "@emphasis";
        };
      };
  };
}
