# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the extlinux boot loader. (NixOS wants to enable GRUB by default)
  boot.loader.grub.enable = false;

  # Enables the generation of /boot/extlinux/extlinux.conf
  boot.loader.generic-extlinux-compatible.enable = true;

  ## Kernel Packages ##
  # boot.kernelPackages = pkgs.linuxPackages_latest;

  ## Networking ##
  networking.hostName = "nix-pad"; # Define your hostname.
  networking.networkmanager.enable = true;
  networking.interfaces.eth0.useDHCP = true;
  networking.interfaces.wlan0.useDHCP = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  ## Set your time zone ##
  time.timeZone = "America/Los_Angeles";
  
  ## Select internationalisation properties ##
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  ## Enable the X11 windowing system ##
  services.xserver = {
    enable = true;
    # enable = false;

    # Enable touchpad support (enabled default in most desktopManager).
    # libinput.enable = true;

    # Configure keymap in X11
    # layout = "us";
    # xkbOptions = "eurosign:e";

    # services.xrdp.defaultWindowManager = "xfce4-session";
    # services.xrdp.defaultWindowManager = "gnome-shell";
    # services.xrdp.enable = true;

    # displayManager.sddm.enable  = true;
    displayManager.gdm.enable = true;
    # displayManager.lightdm.enable = true;

    # desktopManager.plasma5.enable = true;
    desktopManager.gnome.enable = true;
    # desktopManager.xfce.enable = true;
  };
  
  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  ## User accounts -- Don't forget to set a password with ‘passwd’ ##
  users.users.me = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  ## System Packages ##
  environment.systemPackages = with pkgs; [
    # Version control / archiving
    git # gitAndTools.hub mercurial bazaar subversion unzip zip unrar p7zip dtrx

    # Debugging / monitoring / analyzing
    # htop
    # ipmitool
    # iotop
    # powertop
    # ltrace
    # strace
    # linuxPackages.perf
    # pciutils
    # lshw
    # smartmontools
    # usbutils
    # ncdu
    # ncdu -x / # crawl moded dirs
    # nix-tree # Interactively browse dependency graphs of Nix derivations.
    
    ## Virtualization ##
    # virt-manager

    # kde-gtk-config
    # oxygen-gtk 

    ## Mulitouch ##
    # touchegg
    # onboard # - not working correctly
    # CuboCore.corekeyboard # - crashes
    # squeekboard # - gnome/wayland
    # svkbd

    ## Networking ##
    chromium
    # inetutils
    # wireshark
    # wget
    # nix-prefetch-scripts
    # nmcli 
    # NetworkManager 

    # Admin / Storage / Infrastructure Tools
    # glusterfs
    # mergerfs
    # gptfdisk
    # xfsprogs
    # gparted
    # parted
    # tmux
    # cryptsetup

    ## Linux shell utils ##
    # pmutils
    # psmisc
    # which file
    # binutils
    # bc
    # utillinuxCurses
    # exfat
    # dosfstools
    # patchutils
    # moreutils

    ## Command line programs ##
    # fish
    # k2pdfopt
    # ncmpcpp
    # mpc_cli
    # beets
    # wpa_supplicant
    # mp3gain
    # mpv
    # haskellPackages.themplate
    # abcde
    # vorbisgain
    # dfc
    # ripgrep
    # aspell
    # weechat

    ## Man pages ##
    # nix-index
    # man man-pages
    # posix_man_pages
    # stdman

    ## Development tools ##
    # niv llvm haskellPackages.ghc
    # cmake
    # gnumake
    # gcc

    ## GUI Apps ##
    # firefox
    # vlc

  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  ## List services that you want to enable:

  ## Enable the OpenSSH daemon ##
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
  system.stateVersion = "22.05"; # Did you read the comment?

}