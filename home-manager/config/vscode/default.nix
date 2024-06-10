{ config, pkgs, ... }: {
  programs.vscode = {
    enable = true;
    userSettings = {
      # "editor.renderWhitespace" = "all";
      # "files.autoSave" = "onFocusChange";
      # "editor.rulers" = [ 80 120 ];
      # "editor.tabSize" = 2;
      # "files.exclude" = { "**/node_modules/**" = true; };
      # "editor.formatOnSave" = true;
      # "breadcrumbs.enabled" = true;
      # "editor.useTabStops" = false;
      # "editor.fontFamily" = "JetBrainsMono Nerd Font";
      # "editor.fontSize" = 13;
      # "editor.fontLigatures" = true;
      # "editor.lineHeight" = 20;
      # "files.trimTrailingWhitespace" = true;
      # "editor.minimap.enabled" = false;
      # "workbench.editor.enablePreview" = false;
      # "terminal.integrated.fontFamily" = "JetBrainsMono Nerd Font";
      # "workbench.fontAliasing" = "antialiased";
      # "workbench.colorTheme" = "Dracula";
      # "workbench.iconTheme" = "material-icon-theme";
      # "editor.inlineSuggest.enabled" = true;
      # "workbench.sideBar.location" = "right";
      # "search.exclude" = {
      #   "**/.cache" = true;
      #   "**/.next" = true;
      #   "**/coverage" = true;
      #   "**/dist" = true;
      #   "**/node_modules" = true;
      #   "**/target" = true;
      # };
      # "files.exclude" = {
      #   "**/.classpath" = true;
      #   "**/.factorypath" = true;
      #   "**/.idea" = true;
      #   "**/.project" = true;
      #   "**/.settings" = true;
      # };
      # "github.copilot.enable" = {
      #   "*" = true;
      #   "yaml" = false;
      #   "plaintext" = false;
      #   "markdown" = true;
      # };
      # # Disable telemetry + extra
    	# "clangd.checkUpdates" = false;
    	# "code-runner.enableAppInsights" = false;
    	# "docker-explorer.enableTelemetry" = false;
    	# "extensions.ignoreRecommendations" = true;
    	# "gitlens.showWelcomeOnInstall" = false;
    	# "gitlens.showWhatsNewAfterUpgrades" = false;
    	# "java.help.firstView" = "none";
    	# "java.help.showReleaseNotes" = false;
    	# "julia.enableTelemetry" = false;
    	# "kite.showWelcomeNotificationOnStartup" = false;
    	# "liveServer.settings.donotShowInfoMsg" = true;
    	# "Lua.telemetry.enable" = false;
    	# "material-icon-theme.showWelcomeMessage" = false;
    	# "pros.showWelcomeOnStartup" = false;
    	# "pros.useGoogleAnalytics" = false;
    	# "redhat.telemetry.enabled" = false;
    	# "rpcServer.showStartupMessage" = false;
    	# "shellcheck.disableVersionCheck" = true;
    	# "sonarlint.disableTelemetry" = true;
    	# "telemetry.enableCrashReporter" = false;
    	# "telemetry.enableTelemetry" = false;
    	# "telemetry.telemetryLevel" = "off";
    	# "terraform.telemetry.enabled" = false;
    	# "update.showReleaseNotes" = false;
    	# "vsicons.dontShowNewVersionMessage" = true;
    	# "workbench.welcomePage.walkthroughs.openOnInstall" = false;
      "security.workspace.trust.untrustedFiles": "open",
      "editor.cursorSmoothCaretAnimation": "on",
      "editor.defaultFormatter": "esbenp.prettier-vscode",
      "editor.formatOnSave": true,
      "github.copilot.chat.fixTestFailures": true,
      "liveServer.settings.donotShowInfoMsg": true,
      "terminal.integrated.profiles.linux": {
        "bash": {
          "path": "bash",
          "icon": "terminal-bash"
        },
        "zsh": {
          "path": "zsh"
        },
        "fish": {
          "path": "fish"
        },
        "tmux": {
          "path": "tmux",
          "icon": "terminal-tmux"
        },
        "pwsh": {
          "path": "pwsh",
          "icon": "terminal-powershell"
        },
        "zsh (2)": {
          "path": "/usr/bin/zsh"
        }
      },
      "terminal.integrated.defaultProfile.linux": "zsh (2)",
      "security.allowedUNCHosts": ["wsl.localhost"],
      "terminal.integrated.profiles.windows": {
        "PowerShell": {
          "source": "PowerShell",
          "icon": "terminal-powershell"
        },
        "Command Prompt": {
          "path": [
            "${env:windir}\\Sysnative\\cmd.exe",
            "${env:windir}\\System32\\cmd.exe"
          ],
          "args": [],
          "icon": "terminal-cmd"
        },
        "Git Bash": {
          "source": "Git Bash"
        },
        "Ubuntu-22.04 (WSL)": {
          "path": "C:\\WINDOWS\\System32\\wsl.exe",
          "args": ["-d", "Ubuntu-22.04"]
        }
      },
      "terminal.integrated.defaultProfile.windows": "Ubuntu-22.04 (WSL)",
      "github.copilot.editor.enableAutoCompletions": true,
      "files.exclude": {
        "**/.trunk/*actions/": true,
        "**/.trunk/*logs/": true,
        "**/.trunk/*notifications/": true,
        "**/.trunk/*out/": true,
        "**/.trunk/*plugins/": true
      },
      "files.watcherExclude": {
        "**/.trunk/*actions/": true,
        "**/.trunk/*logs/": true,
        "**/.trunk/*notifications/": true,
        "**/.trunk/*out/": true,
        "**/.trunk/*plugins/": true
      },
      "workbench.sideBar.location": "right",
      "workbench.colorTheme": "Xcode Default (Dark Customized Version)",
      "workbench.iconTheme": "material-icon-theme"
    };
  };
}