{ config, pkgs, ... }:

{
  programs = {
    firefox = {
      enable = true;
      #package = pkgs.librewolf;

      /* ---- POLICIES ---- */
      # Check about:policies#documentation for options.
      policies = {
        /* ---- EXTENSIONS ---- */
        # Check about:support for extension/add-on ID strings.
        # Valid strings for installation_mode are "allowed", "blocked",
        # "force_installed" and "normal_installed".
        ExtensionSettings = {
          #"*".installation_mode = "blocked"; # blocks all addons except the ones specified below
	  "{c4b582ec-4343-438c-bda2-2f691c16c262}" = {
	    install_url = "https://addons.mozilla.org/firefox/downloads/latest/600-sound-volume/latest.xpi";
	    installation_mode = "force_installed";
	  };
          "uBlock0@raymondhill.net" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
            installation_mode = "force_installed";
          };
          "plasma-browser-integration@kde.org" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/plasma-integration/latest.xpi";
            installation_mode = "force_installed";
          };
          "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
            installation_mode = "force_installed";
          };
          "{84601290-bec9-494a-b11c-1baa897a9683}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/ctrl-number-to-switch-tabs/latest.xpi";
            installation_mode = "force_installed";
          };
          "{a7399979-5203-4489-9861-b168187b52e1}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/purpleadblock/latest.xpi";
            installation_mode = "force_installed";
          };
        };
      };
    };
  };
}
