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
    ./configuration.nix
    ../modules/nixos/docker.nix
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      sam.imports = [
        ../home-manager/raise.nix
      ];
    };
    backupFileExtension = "backup";
  };

  environment.systemPackages = with pkgs; [
    awscli2
    slack
    vault-bin
  ];
}
