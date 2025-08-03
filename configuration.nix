# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

# corrige erro de suspend
  hardware.firmware = with pkgs; [ linux-firmware ];
  hardware.graphics = {
	  enable = true;
	  enable32Bit = true;
  };

# Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # Define Windows como sistema padrão de boot
  # boot.loader.systemd-boot.extraEntries = {
  #   "windows.conf" = ''
  #     title Windows
  #     efi /EFI/Microsoft/Boot/bootmgfw.efi
  #   '';
  # };
  # boot.loader.systemd-boot.default = "windows.conf";

#Deleta bkps
    nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 30d";
    };

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  fonts.packages = with pkgs; [
	  nerd-fonts.fira-code
		  nerd-fonts.droid-sans-mono
  ];
# Select internationalisation properties.
  i18n.defaultLocale = "pt_BR.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "br";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "br-abnt2";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mateus = {
    isNormalUser = true;
    description = "mateus";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
	gcc
    	neovim
	google-chrome
	mpv
	yt-dlp
	git
	alacritty
	ghostty
	helix	
# PHP LSP
	phpactor
# Ferramentas úteis
	ripgrep
	fzf
	tree-sitter
	zoxide
    ];
  };

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "mateus";

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  services.fwupd.enable = true;

  # flatpak
  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
	  wantedBy = [ "multi-user.target" ];
	  path = [ pkgs.flatpak ];
	  script = ''
		  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
		  '';
  };
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
	    gnome-software
	    gnome-tweaks
	    wget
	    php83
	    php83Packages.composer
	    # php83Packages.pdo
	    # php83Packages.pdo_mysql
	    # php83Packages.mbstring
	    # php83Packages.tokenizer
	    # php83Packages.xml
	    # php83Packages.curl
	    # php83Packages.bcmath
	    unzip
	    nodejs_20  # Laravel frontend tooling (Vite)
	    yarn
	    mysql80
	    starship
  ];
  ## Habilita o MySQL como serviço
  # services.mysql = {
  #   enable = true;
  #   package = pkgs.mysql80;
  #   initialDatabases = [
  #     { name = "laravel"; }
  #   ];
  #   initialRootPassword = "root";  # Altere isso em produção!
  # };	
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
