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
    ../modules/home-manager
  ];

  systemd.user.startServices = "sd-switch";

  programs.home-manager.enable = true;

  nixpkgs = {
    overlays = [
      inputs.nur.overlays.default
      inputs.vscode-extensions.overlays.default
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
      outputs.overlays.affinity-packages
    ];
    config = {
      allowUnfree = true;
    };
  };

  xdg.userDirs.createDirectories = false;

  programs.nix-index = {
    enable = true;
    enableBashIntegration = true;
  };

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

  programs.vscode = {
    enable = true;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        anthropic.claude-code
        charliermarsh.ruff
        eddiedover.gdscript-formatter-linter
        esbenp.prettier-vscode
        geequlim.godot-tools
        github.vscode-pull-request-github
        james-yu.latex-workshop
        jnoortheen.nix-ide
        ms-azuretools.vscode-containers
        ms-python.isort
        ms-python.python
        ms-python.vscode-pylance
        ms-vscode-remote.remote-containers
        ms-vscode-remote.remote-ssh
        piousdeer.adwaita-theme
        tomoki1207.pdf
      ];
      userSettings = {
        "chat.editing.confirmEditRequestRemoval" = false;
        "editor.formatOnSave" = true;
        "editor.minimap.enabled" = false;
        "editor.renderLineHighlight" = "none";
        "explorer.confirmDelete" = false;
        "files.insertFinalNewline" = true;
        "git.allowForcePush" = true;
        "git.autofetch" = true;
        "git.confirmForcePush" = false;
        "git.enableSmartCommit" = true;
        "godotFormatterAndLinter.lintSeverityLevel" = "Warning";
        "godotTools.editor.revealTerminal" = false;
        "godotTools.lsp.autoReconnect.attempts" = 3;
        "remote.autoForwardPortsSource" = "hybrid";
        "remote.SSH.configFile" = "${config.home.homeDirectory}/metalman2/.devops/ssh/config";
        "remote.SSH.enableRemoteCommand" = true;
        "scm.defaultViewMode" = "tree";
        "window.autoDetectColorScheme" = true;
        "window.commandCenter" = true;
        "window.titleBarStyle" = "custom";
        "workbench.editor.enablePreviewFromQuickOpen" = true;
        "workbench.editor.limit.enabled" = true;
        "workbench.editor.limit.value" = 5;
        "workbench.preferredDarkColorTheme" = "Default Dark Modern";
        "workbench.preferredLightColorTheme" = "Default Light Modern";
        "workbench.productIconTheme" = "adwaita";
        "workbench.tree.indent" = 12;
        "workbench.welcomePage.walkthroughs.openOnInstall" = false;
      };
    };
  };

  home.stateVersion = "25.11";
}
