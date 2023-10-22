{pkgs, config, ...}:

{
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
        clock = true;
        indicator = true;
        indicator-thickness = 5;
        line-uses-ring = true;

        key-hl-color = config.colorScheme.colors.base05;
        bs-hl-color = config.colorScheme.colors.base08;

        inside-color = config.colorScheme.colors.base01;
        ring-color = config.colorScheme.colors.base00;
        text-color = config.colorScheme.colors.base05;

        inside-clear-color = config.colorScheme.colors.base01;
        ring-clear-color = config.colorScheme.colors.base00;
        text-clear-color = config.colorScheme.colors.base05;

        inside-ver-color = config.colorScheme.colors.base01;
        ring-ver-color = config.colorScheme.colors.base00;
        text-ver-color = config.colorScheme.colors.base05;

        inside-wrong-color = config.colorScheme.colors.base01;
        ring-wrong-color = config.colorScheme.colors.base00;
        text-wrong-color = config.colorScheme.colors.base05;

        text-caps-lock-color = config.colorScheme.colors.base05;
        image = "~/Pictures/omer-tunc-sds.jpg";
        effect-blur = "7x5";
        grace = 2;
    };
  };
}
