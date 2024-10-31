# sat-pix-conf
# help: nixos-help, configuration.nix(5) man mage

{ config, pkgs, ... }:
{
  imports = [
    # Include the results of the hardware scan.
    # <nixos-hardware/apple/t2>
    /home/sat/.config/home-manager/home.nix
    ./hardware-configuration.nix
    "${builtins.fetchGit {
      url = "https://github.com/NixOS/nixos-hardware.git";
      rev = "07d15e8990d5d86a631641b4c429bc0a7400cfb8";  # Ver 2024-10-29
    }}/apple/t2"
  ];

  hardware.firmware = [
    (pkgs.stdenvNoCC.mkDerivation (final: {
      name = "brcm-firmware";
      src = ./firmware/brcm;
      installPhase = ''
        mkdir -p $out/lib/firmware/brcm
        cp ${final.src}/* "$out/lib/firmware/brcm"
      '';
    }))
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "sat-nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  
  # Allow unfree software, printing 
  nixpkgs.config.allowUnfree = true;
  services.printing.enable = true;

  # attempt to fix macbook wifi adapter
  # boot.kernelModules = [ "wl" ];
  # boot.extraModulePackages = [ config.boot.kernelPackages.broadcom_sta ];
  # boot.blacklistedKernelModules = [ "b43" "bcma" ];

  # this is only useful to start iGPU on MBP
  # hardware.apple-t2.enableAppleSetOsLoader = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Toronto";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  # Enable X11 windowing system + other things
  services.xserver = {
    enable = true;

    # XFCE things

    # Enable the XFCE desktop environment
    displayManager.lightdm.enable = false;
    desktopManager.xfce.enable = false;
    ###

    # KDE Plasma environment
    desktopManager.plasma5.enable = true;
  };

  # More KDE
  services.displayManager.sddm.enable = true;
  # services.plasma5.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Touchpad support
  services.libinput.enable = true;

  # Enable sound with pipewire
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sat = {
    isNormalUser = true;
    description = "sat";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  # Additional included packages
  programs.firefox.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # essentials
    vim
    wget
    git
    fastfetch
    tree
    zsh
    home-manager
    # kde
    # kde-applications
    # plasma-workspace
    # utility
    alsa-utils  # for amixer
    # linux-apfs-rw
    # linuxPackages_6_6
    # linuxPackages.kernel
    # linuxPackages.kernelHeaders
    dmg2img
    hyprland
    kitty 
    swaybg
    swaylock
    alacritty
    dunst
    rofi
    picom
    wayland
    autojump
    yakuake
    # programming
    vscode
    python3
    gcc
    gnumake
    # entertainment
    discord
    spotify
    # work
    libreoffice-qt
    hunspell
    hunspellDicts.en_CA
    audacity
    gimp
  ];

  # programs config

  ### hyprland
  programs.hyprland.enable = true; # enable Hyprland

  # Optional, hint Electron apps to use Wayland:
  # environment.sessionVariables.NIXOS_OZONE_WL = "1";

  ###

  # services.wayland.enable = true;

  # services.networkmanager.enable = true;
  # services.xserver.enable = false;
  # services.xserver.displayManager.startx.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

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
  system.stateVersion = "24.05"; # Did you read the comment?

}

