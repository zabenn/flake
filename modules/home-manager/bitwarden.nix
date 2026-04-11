{ config, pkgs, ... }:
{
  services.ssh-agent.enable = false;

  home.sessionVariables = {
    SSH_AUTH_SOCK = "${config.home.homeDirectory}/.bitwarden-ssh-agent.sock";
  };

  home.file.".ssh/zabenn.pub" = {
    source = ../../dotfiles/ssh/zabenn.pub;
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks."*" = {
      identityFile = "${config.home.homeDirectory}/.ssh/zabenn.pub";
    };
  };
}
