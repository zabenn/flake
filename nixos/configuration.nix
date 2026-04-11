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
    inputs.nix-index-database.nixosModules.nix-index
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = false;
    };
  };

  hardware.ckb-next = {
    enable = true;
    package = pkgs.ckb-next;
  };

  nixpkgs = {
    overlays = [
      inputs.nur.overlays.default
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
      outputs.overlays.affinity-packages
    ];
    config = {
      allowUnfree = true;
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

  services.logind.settings.Login = {
    HandleLidSwitch = "suspend";
    HandleLidSwitchDocked = "ignore";
    HandleLidSwitchExternalPower = "ignore";
  };

  services.automatic-timezoned.enable = true;

  services.geoclue2 = {
    enable = true;
    geoProviderUrl = "https://api.beacondb.net/v1/geolocate";
  };

  services.printing.enable = true;

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  services.speechd = {
    enable = true;
  };

  environment.etc."speech-dispatcherc/clients/hypnos.conf".source =
    ../dotfiles/steam/hypnospace_outlaw/hypnos.conf;
  environment.etc."speech-dispatcher/speechd.conf".source =
    ../dotfiles/steam/hypnospace_outlaw/speechd.conf;

  environment.systemPackages = with pkgs; [
    affinity.v3
    blender
    bitwarden-desktop
    discord
    exfat
    firefox
    flyctl
    git
    gnome-network-displays
    nixfmt-rfc-style
    nodejs
    pnpm
    python3
    spotify
    steam
    tinty
    tree
    unstable.claude-code
    unstable.godot
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

  system.stateVersion = "25.11";
}
