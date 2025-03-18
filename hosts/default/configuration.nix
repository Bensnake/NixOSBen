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
      ../../modules/nixos/kvm.nix
      #../../modules/nixos/hyprland.nix
    ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

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

  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;
  programs.xwayland.enable = true;

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
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  powerManagement.enable = true;

  services.thermald.enable = true;

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
  
  programs.adb.enable = true;

  programs.steam.enable = true;

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
    #dialout group is for arduino
    extraGroups = [ "networkmanager" "wheel" "dialout" ];
    packages = with pkgs; [];
    createHome = true;
  };

  nixpkgs.config.allowUnfree = true;

  programs.git.enable = true;

  programs.npm.enable = true;

  programs.java.enable = true;

#  nixpkgs.config.android_sdk.accept_license = true;

  virtualisation.waydroid.enable = true;

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "ben" ];

  nixpkgs.overlays = [
    (final: _prev: {
      unstable = import inputs.nixpkgs-unstable {
        system = final.system;
        config.allowUnfree = true;
      };
    })
  ];

  environment.systemPackages = with pkgs; [
     scenebuilder
     libGL
     android-studio

     unstable.ciscoPacketTracer8
     unstable.arduino-ide

     gimp
     nodejs
     cloudflared
     neovim
     wl-clipboard
     vscode.fhs
     gcc
     (python3.withPackages(ps: with ps; [ pip ]))
     pipenv
     yt-dlp
     vesktop
     qbittorrent
     mpv
     neofetch
     pfetch
     libreoffice
     thunderbird
	 librewolf
     ungoogled-chromium
     google-chrome
	 miraclecast

     anytype

     yt-dlp
     kdenlive
     obs-studio

     wineWowPackages.stable
     winetricks
     protonup-qt
     mangohud
     lutris
     heroic
     prismlauncher
  ];

  fonts.packages = with pkgs; [
  	nerdfonts
    noto-fonts
    roboto
	roboto-mono
  ];
  system.stateVersion = "24.05";

}
