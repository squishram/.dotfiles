{ config, pkgs, ... }:

{
  imports =
    [
      # essential to include the results of the hardware scan
      ./hardware-configuration.nix
      <home-manager/nixos>
    ];


  fonts.fonts = with pkgs; [
    # don't use all of the nerdfonts; pick your faves
    (nerdfonts.override {fonts = [ "CascadiaCode" "ComicShannsMono" ];})
  ]

  environment.systemPackages = with pkgs; [
  home-manager
    keychain
    pavucontrol
    git
    stow
    zoxide
    eza
    bat
    fd
    ripgrep
    wget
    gcc
    unzip
  ];

  # Bootloader.
  boot = {
    # use the latest kernel
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      timeout = 20;
      # systemd-boot.enable = true;
      # efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        version = 2;
        configurationLimit = 10;
      };
    };
  };

  # enable flakes & command
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      # garbage collection to remove old builds
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 14d"
      };
    };
  };

  # Define your hostname
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  # Set your time zone.
  time.timeZone = "Europe/London";
  # Select internationalisation properties
  i18n.defaultLocale = "en_GB.UTF-8";

  # Configure X11
  services.xserver = {
    enable = true;
    xkb.layout = "gb";
    xkb.variant = "";
    displayManager = {
      lightdm.enable = true;
      defaultSession = "none+leftwm";
    };
    windowManager.leftwm.enable = true;
    videoDrivers = ["nvidia"];
    # NOTE: change to true for laptop
    libinput = false;
  };

  # Configure console keymap (for tty)
  console.keyMap = "uk";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.squish = {
    isNormalUser = true;
    description = "Ishan";
    # for printer, audio, video, wifi, and sudo usage respectively
    extraGroups = [ "lp" "audio" "video" "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  # Some programs need SUID wrappers, can be configured further or are started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    }
  }

  # zsh is where it's at
  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  # enabling sound with pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    audio.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  hardware = {

    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    opengl = {
      enable = true;
      driSupport = true;
      driSupport32bit = true;
    };

    nvidia = {
      # selecting the appropriate driver
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      # open source kernel modeules are alpha and buggy
      open = false;
      # Access Nvidia settings menu
      nvidiaSettings = true;
      modesetting.enable = true;
      # Disable these if they cause trouble
      powerManagement = {
        enable = true;
        finegrained = true;
      };
    };

  };


# programs.hyprland = {
#   enable = true;
#   # lets hyprland use nvidia GPUs
#   enableNvidiaPatches = true;
#   # lets hyprland use x apps
#   xwayland.enable = true;
# };

# environment.sessionVariables = {
#   # stops cursor turning invisible
#   WLR_NO_HARDWARE_CURSORS = "1";
#   # helps electron apps use wayland
#   NIXOS_OZONE_WL = "1";
# };

# Configure network proxy if necessary
# networking.proxy.default = "http://user:password@proxy:port/";
# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";


# Open ports in the firewall.
# networking.firewall.allowedTCPPorts = [ ... ];
# networking.firewall.allowedUDPPorts = [ ... ];
# Or disable the firewall altogether.
# networking.firewall.enable = false;

# https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11"; # Did you read the comment?

}
