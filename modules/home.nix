{ inputs, pkgs, ... }:
{
  home.stateVersion = "25.11";

  # ---------------------------------------------------------
  # GNOME Desktop Configuration (Dconf)
  # ---------------------------------------------------------
  dconf.settings = {
    # Interface: Dark Theme & Clock
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      clock-show-weekday = true;
      show-battery-percentage = true;
      enable-hot-corners = false;
    };

    # Peripherals: Touchpad
    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
      natural-scroll = true;
    };

    # Window Management
    "org/gnome/mutter" = {
      center-new-windows = true;
      dynamic-workspaces = true;
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close"; # Adds min/max buttons
    };

    # Shell: Dock Favorites
    "org/gnome/shell" = {
      favorite-apps = [
        "firefox.desktop"
        "org.gnome.Console.desktop"
        "org.gnome.Nautilus.desktop"
        "org.gnome.Settings.desktop"
      ];
    };

    # Text Editor
    "org/gnome/TextEditor" = {
      restore-session = true;
      show-line-numbers = true;
      highlight-current-line = true;
    };
  };

  # ---------------------------------------------------------
  # User Packages
  # ---------------------------------------------------------
  home.packages = with pkgs; [
    # System Helpers
    nh
    nix-du
    nix-tree

    # Modern Coreutils
    bat
    eza
    fd
    ripgrep

    # Core Editors
    micro
    nano

    # Productivity Tools
    fzf
    tealdeer
    tmux

    # Utilities
    bind
    curl
    inetutils
    ipcalc
    tcpdump
    wget
    wl-clipboard-rs

    # System Monitoring
    btop

    # Miscellaneous
    git
  ];

  home.sessionVariables = {
    EDITOR = "micro";
    # Point nh to your flake location so it works automatically
    FLAKE = "/etc/nixos";
  };

  # ---------------------------------------------------------
  # Shell Configuration
  # ---------------------------------------------------------
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent = ''
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word
    '';

    shellAliases = {
      ls = "eza --smart-group --icons";
      la = "eza --smart-group -a --icons";
      ll = "eza --smart-group -l --icons";
      cat = "bat";
      grep = "grep --color=auto";
    };

    history = {
      size = 100000;
      ignoreAllDups = true;
      path = "$HOME/.zsh_history";
    };
  };

  # ---------------------------------------------------------
  # Program Modules
  # ---------------------------------------------------------
  programs.home-manager.enable = true;
  programs.nix-index.enable = true;
  programs.nix-index-database.comma.enable = true;
  programs.starship.enable = true;
  programs.zoxide.enable = true;

  programs.git = {
    enable = true;
    userName = "Patrick Hein";
    userEmail = "bagbag98@googlemail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
