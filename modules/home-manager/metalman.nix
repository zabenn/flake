{ config, pkgs, ... }:
{
  home.sessionVariables = {
    VAULT_ADDR = "https://onsite-cluster-public-vault-1f1ef36e.c13c227f.z1.hashicorp.cloud:8200";
    VAULT_NAMESPACE = "admin";
    GITHUB_USERNAME = "samraise";
    GITHUB_PRIVATE_KEY = "${config.home.homeDirectory}/.ssh/samraise.pub";
    GITHUB_PUBLIC_KEY = "${config.home.homeDirectory}/.ssh/samraise.pub";
    GITHUB_CERTIFICATE = "${config.home.homeDirectory}/.ssh/github_certificate.pub";
    REMOTE_SUPPORT_PRIVATE_KEY = "${config.home.homeDirectory}/.ssh/samraise.pub";
    REMOTE_SUPPORT_PUBLIC_KEY = "${config.home.homeDirectory}/.ssh/samraise.pub";
    REMOTE_SUPPORT_CERTIFICATE = "${config.home.homeDirectory}/.ssh/remote_support_certificate.pub";
    METALMAN_DIR = "${config.home.homeDirectory}/metalman2";
  };

  home.file.".ssh/samraise.pub".source = ../../dotfiles/ssh/samraise.pub;

  programs.ssh.includes = [ "\${METALMAN_DIR}/.devops/ssh/config" ];
}
