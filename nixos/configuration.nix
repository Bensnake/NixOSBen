{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; 
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Riyadh";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  services.xserver = {
    layout = "us, ara";
    xkbVariant = "";
  };

  programs.hyprland = {
  	enable = true;
	# nvidiaPatches = true;
	xwayland.enable = true;
  };
  xdg.portal.enable = true;
  security.pam.services.swaylock = {};

  # nvidia fixes
  #environment.sessionVariables = {
	# fixes invisible cursor
  	#WLR_NO_HARDWARE_CURSORS = "1";

	# hint electron apps to run with wayland
  	#NIXOS_OZONE_WL = "1";
  #};

  hardware.opengl = {
  	enable = true;
  	driSupport = true;
  	driSupport32Bit = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;

    # laptop
    powerManagement.enable = true;
    powerManagement.finegrained = true;
    open = true;
    prime = {
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
    };

    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  services.xserver.videoDrivers = ["nvidia"];

  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
  	enable = true;
	alsa.enable = true;
	alsa.support32Bit = true;
	pulse.enable = true;
	jack.enable = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ben = {
    isNormalUser = true;
    home = "/home/ben";
    description = "Moaaz Ahmed";
    extraGroups = [ "networkmanager" "wheel" "input" ];
    packages = with pkgs; [];
  };
  
  services.udisks2.enable = true;

  powerManagement.enable = true;

  services.thermald.enable = true;

  services.auto-cpufreq = {
    enable = true;
    settings = {
      battery = {
	governor = "powersave";
	turbo = "never";
      };
      charger = {
	governor = "performance";
	turbo = "always";
      };
    };
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    home-manager
    brightnessctl
    playerctl
    anytype
    # Neovim
    neovim 
    wl-clipboard

    # Stuff for my neovim config some of which is just useful stuff as well
    tree-sitter
    ripgrep
    fd
    gcc
    nodejs
    git
    gnumake
    wget
    curl
    unzip
    gnutar
    gzip

    hyprpaper
    (waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      })
    )
    wlogout
    swayidle
    swaylock-effects
    networkmanagerapplet
    rofi-wayland
    pavucontrol
    swaynotificationcenter

    udiskie

    alacritty
    xfce.thunar
    firefox
    neofetch
    pfetch
    onlyoffice-bin
    gimp

    # Screenshots
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
    hyprpicker

    # gaming
    wineWowPackages.stable
    winetricks
    heroic
    steam
    lutris
  ];


  fonts.fonts = with pkgs; [
    nerdfonts
    noto-fonts
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "23.05";

}
