{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
    ../modules/nixos
    inputs.home-manager.nixosModules.home-manager
    inputs.nix-flatpak.nixosModules.nix-flatpak
    inputs.nix-index-database.nixosModules.nix-index
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = false;
  };

  hardware.ckb-next = {
    enable = true;
    package = pkgs.ckb-next;
  };

  nixpkgs = {
    overlays = [
      inputs.affinity-nix.overlays.default
      inputs.nix-vscode-extensions.overlays.default
      inputs.nur.overlays.default
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "electron-39.8.10"
      ];
    };
  };

  nix =
    let
      flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
    in
    {
      settings = {
        experimental-features = "nix-command flakes";
        flake-registry = "";
        nix-path = config.nix.nixPath;
      };
      channel.enable = false;

      registry = lib.mapAttrs (_: flake: { inherit flake; }) flakeInputs;
      nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
    };

  programs.nix-ld.enable = true;

  networking.networkmanager.enable = true;

  zramSwap.enable = true;

  services = {
    automatic-timezoned.enable = true;
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    flatpak = {
      enable = true;
      packages = [
        "org.vinegarhq.Sober"
      ];
    };
    geoclue2 = {
      enable = true;
      geoProviderUrl = "https://api.beacondb.net/v1/geolocate";
    };
    howdy = {
      enable = true;
      control = "sufficient";
    };
    linux-enable-ir-emitter.enable = true;
    logind.settings.Login = {
      HandleLidSwitch = "suspend";
      HandleLidSwitchDocked = "ignore";
      HandleLidSwitchExternalPower = "ignore";
    };
    printing.enable = true;
  };

  environment.systemPackages = with pkgs; [
    affinity-v3
    bitwarden-desktop
    blender
    unstable.godot_4_7
    gtk3
    discord
    exfat
    firefox
    flyctl
    gh
    git
    gnome-network-displays
    howdy
    inkscape
    nixd
    nixfmt
    nodejs_24
    pnpm
    python3
    spotify
    steam
    tinty
    tree
    uv
    vscode
  ];

  users.users = {
    sam = {
      isNormalUser = true;
      home = "/home/sam";
      description = "Sam Cribbs";
      extraGroups = [
        "networkmanager"
        "users"
        "wheel"
      ];
    };
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      sam.imports = [
        ../home-manager/home.nix
      ];
    };
  };

  system.stateVersion = "26.05";
}
