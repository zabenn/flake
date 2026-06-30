{ config, ... }:
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
    settings."*" = {
      IdentityFile = "${config.home.homeDirectory}/.ssh/zabenn.pub";
    };
  };
}
