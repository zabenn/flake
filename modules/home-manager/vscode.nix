{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.unstable.vscode;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        charliermarsh.ruff
        eddiedover.gdscript-formatter-linter
        esbenp.prettier-vscode
        geequlim.godot-tools
        github.copilot
        github.copilot-chat
        github.vscode-pull-request-github
        james-yu.latex-workshop
        jnoortheen.nix-ide
        leetcode.vscode-leetcode
        ms-azuretools.vscode-containers
        ms-python.isort
        ms-python.python
        ms-python.vscode-pylance
        ms-vscode-remote.remote-containers
        ms-vscode-remote.remote-ssh
        piousdeer.adwaita-theme
      ];
      userSettings = {
        "[latex]" = {
          "editor.defaultFormatter" = "James-Yu.latex-workshop";
        };
        "chat.editing.confirmEditRequestRemoval" = false;
        "chat.mcp.gallery.enabled" = true;
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
        "latex-workshop.formatting.latex" = "latexindent";
        "remote.autoForwardPortsSource" = "hybrid";
        "remote.SSH.enableRemoteCommand" = true;
        "scm.defaultViewMode" = "tree";
        "security.workspace.trust.untrustedFiles" = "open";
        "task.problemMatchers.neverPrompt" = {
          "shell" = true;
        };
        "window.autoDetectColorScheme" = true;
        "window.commandCenter" = true;
        "window.titleBarStyle" = "custom";
        "workbench.editor.enablePreviewFromQuickOpen" = true;
        "workbench.editor.limit.enabled" = true;
        "workbench.editor.limit.value" = 5;
        "workbench.preferredDarkColorTheme" = "Dark Modern";
        "workbench.preferredLightColorTheme" = "Light Modern";
        "workbench.tree.indent" = 12;
        "workbench.welcomePage.walkthroughs.openOnInstall" = false;
      };
    };
  };
}
