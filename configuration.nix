{ inputs, config, pkgs, lib, ... }:

{
  # Enable Waydroid
  virtualisation.waydroid.enable = true;

  # Enable and configure fish
  programs.fish.enable = true;

  users.users.kaiguaaaa.shell = pkgs.fish;

  # Enable nftables module
  networking.nftables.enable = true;

  # Enable GNOME keyring
  services.gnome.gnome-keyring.enable = true;
 
  # Greeter avatar config
  systemd.tmpfiles.rules = let
	user = "kaiguaaaa";
	iconPath = ./avatars/profile.jpg; # path to your photo, relative to configuration.nix
  in [
	"f+ /var/lib/AccountsService/users/${user} 0600 root root - [User]\\nIcon=/var/lib/AccountsService/icons/${user}\\n"
	"L+ /var/lib/AccountsService/icons/${user} - - - - ${iconPath}"
  ];

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable Niri
  programs.niri.enable = true;

  # Enable Bluetooth
  hardware.bluetooth.enable = true;
 
  imports = [
    ./hardware-configuration.nix
  ];

  # Bootloader setup
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";
    configurationLimit = 5;

    # Define and package the theme directly inside the theme option
#    theme = inputs.distro-grub-themes.packages.x86_64-linux.nixos-grub-theme;
  };


  distro-grub-themes = {
	enable = true;
	theme = "nixos";
	};

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.initrd.luks.devices."luks-97b14819-4059-4044-a4b8-45e04e671b55".device = "/dev/disk/by-uuid/97b14819-4059-4044-a4b8-45e04e671b55";
  networking.hostName = "latitude5420";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Africa/Nairobi";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

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
    jack.enable = true;
  };

  # Define a user account.
  users.users."kaiguaaaa" = {
    isNormalUser = true;
    description = "jeffreyyyy";
    extraGroups = [ "networkmanager" "wheel" "docker" "audio" ];
    packages = with pkgs; [
      thunderbird
      git
      kitty
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [ ];

  system.stateVersion = "26.11";
}
