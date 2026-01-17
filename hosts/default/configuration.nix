{ config, pkgs, inputs, lib, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/nixos/lanzaboote.nix
      #../../modules/nixos/firefox.nix
      ../../modules/nixos/nvidia.nix
      ../../modules/nixos/laptop-nvidia.nix
      ../../modules/nixos/uniwifi.nix
      # ../../modules/nixos/tuxedo.nix
      #../../modules/nixos/kvm.nix
            #../../modules/nixos/hyprland.nix
      # ../../modules/nixos/stylix.nix
      # ../../modules/nixos/sunshine.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # silent boot
  # boot.initrd.verbose = false;
  # boot.consoleLogLevel = 0;
  # boot.kernelParams = [ "quiet" "udev.log_level=3" ];

  networking.hostName = "nixos";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kuala_Lumpur";

  # Select internationalisation properties.
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

  # services.desktopManager.cosmic.enable = true;
  # services.displayManager.cosmic-greeter.enable = true;
  programs.xwayland.enable = true;

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;
  # services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb.layout = "us, ara";

  services.printing.enable = true;

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
    powerOnBoot = false;
	input.General.ClassicBondedOnly = false;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  powerManagement.enable = true;

  # services.thermald.enable = true;

  #services.tlp.enable = true;

  #services.auto-cpufreq = {
  #  enable = true;
  #  settings = {
  #    battery = {
  #      governor = "powersave";
  #	turbo = "never";
  #    };
  #    charger = {
  #      governor = "performance";
  #	turbo = "always";
  #    };
  #  };
  #};

  hardware.opentabletdriver.enable = true;
  
  programs.steam.enable = true;
  programs.gamescope.enable = true;
  programs.gamemode.enable = true;

  home-manager.backupFileExtension = "bak2";
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "ben" = import ./home.nix;
    };
  };

  users.users.ben = {
    isNormalUser = true;
    description = "ben";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    createHome = true;
  };

  nixpkgs.config.allowUnfree = true;

  programs.git.enable = true;

  programs.npm.enable = true;

  programs.java.enable = true;

#  nixpkgs.config.android_sdk.accept_license = true;

  # virtualisation.waydroid.enable = true;
  # virtualisation.docker.enable = true;
  # virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "ben" ];

  environment.systemPackages = with pkgs; [
     libGL
     android-studio
     android-tools

	 htop
	 mission-center

     gimp
     nodejs
     cloudflared
     neovim
     wl-clipboard
     vscode.fhs
     gcc
     (python3.withPackages(ps: with ps; [ pip numpy pydub notebook ]))
     pipenv
     yt-dlp
	 legcord
	 element-desktop
	 teamspeak6-client
     qbittorrent
     mpv
     neofetch
     pfetch
     libreoffice
     thunderbird
	 librewolf
     google-chrome

     kdePackages.kdenlive
     obs-studio
     ffmpeg
     libgcc

     wineWowPackages.stable
     winetricks
     protonup-qt
     mangohud
     lutris
     heroic
     prismlauncher
  ];

  fonts.packages = with pkgs; [
    roboto
	roboto-mono
  ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
  system.stateVersion = "24.05";

}
