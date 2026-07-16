{ ... }:
{
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      user = {
        name = "Sam Cribbs";
        email = "samuel_cribbs@berkeley.edu";
      };
    };
  };
}
