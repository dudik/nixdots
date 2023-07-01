{ config, pkgs, pkgs-unstable, ... }:

{
  home.username = "samuel";
  home.homeDirectory = "/home/samuel";

  home.packages = with pkgs; [
    # Wayland specific
    imv
    swayidle
    grim
    slurp
    wl-clipboard

    jetbrains-mono
    inter

    pcmanfm
    xarchiver
    pavucontrol
    libreoffice
    libnotify
    lxtask

    ripgrep
    fd

    signal-desktop
  ];

  home.stateVersion = "23.05";

  programs.home-manager.enable = true;

  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        icons-enabled = false;
      };

      border = {
        radius = 0;
        width = 2;
      };

      colors = {
        background = "ffffffff";
        text = "000000ff";
        border = "000000ff";
        match = "000000ff";
        selection = "000000ff";
        selection-text = "ffffffff";
        selection-match = "ffffffff";
      };
    };
  };

  programs.direnv = {
    enable = true;
    nix-direnv = {
      enable = true;
    };
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      add_newline = false;
    };
  };

  programs.zathura = {
    enable = true;
    options = {
      scroll-step = 100;
    };
  };

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
  };

  programs.helix = {
    enable = true;
    package = pkgs-unstable.helix;
    settings = {
      # theme = "gruvbox";
      theme = "monotone";

      editor = {
        statusline = {
          left = [ "mode" "version-control" "spacer" "spinner" ];
          center = [ "file-name" ];
        };
        lsp.display-inlay-hints = true;
        lsp.display-messages = true;
        cursorline = true;
        bufferline = "multiple";
        idle-timeout = 0;
        true-color = true;

        indent-guides = {
          render = true;
        };

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };

        soft-wrap = {
          enable = true;
        };
      };
    };

    themes = {
      monotone =
        let
          b0 = "#000000";
          b1 = "#111111";
          b2 = "#222222";
          b3 = "#333333";
          b4 = "#444444";
          b5 = "#555555";
          b6 = "#666666";
          b7 = "#777777";

          w7 = "#888888";
          w6 = "#999999";
          w5 = "#aaaaaa";
          w4 = "#bbbbbb";
          w3 = "#cccccc";
          w2 = "#dddddd";
          w1 = "#eeeeee";
          w0 = "#ffffff";
        in
        {
          "ui.background" = { fg = b0; bg = w0; };
          "ui.selection" = { modifiers = [ "reversed" ]; };
          "ui.cursor" = { bg = w7; };
          "keyword" = { modifiers = [ "bold" ]; };
          "diagnostic.warning" = { underline = { color = b0; style = "curl"; }; };
          "diagnostic.error" = { underline = { color = b0; style = "curl"; }; };
          "diagnostic.info" = { underline = { color = b0; style = "curl"; }; };
          "diagnostic.hint" = { underline = { color = b0; style = "curl"; }; };
        };
    };
  };

  programs.exa = {
    enable = true;
    enableAliases = true;
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.foot = {
    enable = true;
    settings = {
      tweak = {
        box-drawing-base-thickness = 0.015;
      };
      main = {
        font = "JetBrains Mono NL:style=Regular:size=12.5";
        dpi-aware = true;
        shell = "fish";
      };

      colors = {
        # Default colors
        background = "0xffffff";
        foreground = "0x000000";

        # Normal colors
        regular0 = "0x000000";
        regular1 = "0x000000";
        regular2 = "0x000000";
        regular3 = "0x000000";
        regular4 = "0x000000";
        regular5 = "0x000000";
        regular6 = "0x000000";
        regular7 = "0xffffff";

        # Bright colors
        bright0 = "0x000000";
        bright1 = "0x000000";
        bright2 = "0x000000";
        bright3 = "0x000000";
        bright4 = "0x000000";
        bright5 = "0x000000";
        bright6 = "0x000000";
        bright7 = "0xffffff";
      };
    };
  };

  programs.alacritty = {
    enable = true;
    settings = {
      working_directory = "Desktop";
      font = {
        normal = {
          family = "JetBrains Mono NL";
          style = "Regular";
        };

        size = 13.5;
      };

      cursor = {
        style = {
          blinking = "Never";
        };
      };

      window = {
        dynamic_padding = true;
      };

      shell = {
        program = "fish";
      };

      colors = {
        # Default colors
        primary = {
          background = "0xffffff";
          foreground = "0x000000";
        };

        # Normal colors
        normal = {
          black = "0x000000";
          red = "0x000000";
          green = "0x000000";
          yellow = "0x000000";
          blue = "0x000000";
          magenta = "0x000000";
          cyan = "0x000000";
          white = "0xffffff";
        };

        # Bright colors
        bright = {
          black = "0x000000";
          red = "0x000000";
          green = "0x000000";
          yellow = "0x000000";
          blue = "0x000000";
          magenta = "0x000000";
          cyan = "0x000000";
          white = "0xffffff";
        };
      };
    };
  };

  programs.fish = {
    enable = true;
    functions = {
      fish_greeting = "";
    };
    shellAbbrs = {
      zz = "systemctl suspend";

      gs = "git status";
      ga = "git add";
      gd = "git diff";
      gc = "git commit";
      gp = "git push";
    };
    interactiveShellInit = ''
      fish_vi_key_bindings
    '';
  };

  programs.qutebrowser = {
    enable = true;
    keyBindings = {
      normal = {
        "<Ctrl-v>" = "spawn mpv {url}";
        ",p" = "spawn --userscript qute-pass";
        ",l" = ''config-cycle spellcheck.languages ["en-US"] ["sk-SK"]'';
        ",j" = "config-cycle content.javascript.enabled";
      };
    };
    settings = {
      colors.webpage = {
        darkmode.enabled = true;
        bg = "#282828";
      };
      fonts.web.size.minimum = 17;
      content.blocking.adblock.lists = [
        "https://raw.githubusercontent.com/tomasko126/easylistczechandslovak/master/filters.txt"
        "https://easylist.to/easylist/easylist.txt"
        "https://easylist.to/easylist/easyprivacy.txt"
        "https://secure.fanboy.co.nz/fanboy-annoyance.txt"
      ];
    };
    searchEngines = {
      DEFAULT = "https://searx.be/search?q={}";
    };
  };

  programs.librewolf.enable = true;

  programs.mpv = {
    enable = true;
    config = {
      fullscreen = true;
      ytdl-format = "bestvideo[height<=?1080]+bestaudio/best";
      osd-font = "Inter";
      sub-font = "Inter";
    };
    bindings = {
      "]" = "add speed 0.05";
      "[" = "add speed -0.05";
    };
  };

  programs.yt-dlp = {
    enable = true;
    package = pkgs-unstable.yt-dlp;
  };

  programs.thunderbird = {
    enable = true;
    profiles = {
      "samuel" = {
        isDefault = true;
      };
    };
  };

  programs.git = {
    enable = true;
    delta = {
      enable = true;
      options = {
        syntax-theme = "gruvbox-light";
      };
    };
    userName = "Samuel Dudík";
    userEmail = "24730635+dudik@users.noreply.github.com";
  };

  programs.bash = {
    enable = true;
    profileExtra = ''
      if [ -z $DISPLAY ] && [ $XDG_VTNR -eq 1 ]; then
        exec sway
      fi
    '';
  };

  # TODO Remove after figuring out automounting in a different way
  services.udiskie.enable = true;

  services.mako = {
    enable = true;
    textColor = "#000000";
    backgroundColor = "#ffffff";
    borderColor = "#000000";
    defaultTimeout = 5000;
  };

  services.kanshi = {
    enable = true;
    profiles = {
      undocked = {
        outputs = [
          {
            criteria = "eDP-1";
          }
        ];
      };

      docked = {
        outputs = [
          {
            criteria = "eDP-1";
            status = "disable";
          }
          {
            criteria = "SOMELEC Z.I. Du Vert Galanta Mira133 202105";
          }
        ];
      };
    };
  };

  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 60 * 5;
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
  };

  # programs.i3status-rust = {
  #   enable = true;
  #   bars = {
  #     default = {
  #       settings = {
  #         theme = {
  #           theme = "plain";
  #           overrides = {
  #             idle_bg = "#ffffff";
  #             idle_fg = "#000000";
  #             info_bg = "#ffffff";
  #             info_fg = "#000000";
  #             good_bg = "#ffffff";
  #             good_fg = "#000000";
  #             warning_bg = "#ffffff";
  #             warning_fg = "#000000";
  #             critical_bg = "#ffffff";
  #             critical_fg = "#000000";
  #             separator = "";
  #             separator_bg = "#ffffff";
  #             separator_fg = "#000000";
  #           };
  #         };
  #       };

  #       blocks = [
  #         # {
  #         #   alert = 10.0;
  #         #   block = "disk_space";
  #         #   info_type = "available";
  #         #   interval = 60;
  #         #   path = "/";
  #         #   warning = 20.0;
  #         # }
  #         # {
  #         #   block = "memory";
  #         #   format = " $icon mem_used_percents ";
  #         #   format_alt = " $icon $swap_used_percents ";
  #         # }
  #         # {
  #         #   block = "cpu";
  #         #   interval = 1;
  #         # }
  #         {
  #           block = "sound";
  #         }
  #         {
  #           block = "time";
  #           format = " $timestamp.datetime(f:'%a %d/%m %R') ";
  #           interval = 10;
  #         }
  #       ];
  #     };
  #   };
  # };

  wayland.windowManager.sway = {
    enable = true;
    xwayland = false;
    wrapperFeatures.gtk = true;

    extraConfig = ''
      default_border pixel 1
      workspace_layout tabbed
      hide_edge_borders --i3 smart

      client.focused #000000 #ffffff #000000
      client.unfocused #000000 #ffffff #000000

      # bindswitch lid:on output eDP-1 disable
      # bindswitch lid:off output eDP-1 enable

      focus_wrapping yes
    '';
    config = {
      input = {
        "type:keyboard" = {
          xkb_layout = "us,sk";
          xkb_options = "grp:alt_shift_toggle,altwin:swap_lalt_lwin,grp:alt_shift_toggle";
        };
      };

      seat = {
        "*" = {
          hide_cursor = "5000";
        };
      };

      keybindings = {
        "Mod4+Return" = "exec foot --working-directory ~/Desktop";
        "Mod4+q" = "exec fuzzel";
        "Mod4+w" = "kill";
        "Mod4+t" = "layout toggle tabbed split";
        "Mod4+j" = "focus left";
        "Mod4+k" = "focus right";
        "Mod4+c" = "focus next";

        "Mod4+r" = "exec grim -g \"$(slurp -d -b 00000050)\" - | wl-copy";

        "Mod4+z" = "exec swaymsg -t get_inputs | grep -q 'English' && swaymsg input type:keyboard xkb_layout 'sk(qwerty)' || swaymsg input type:keyboard xkb_layout us";

        "Mod4+semicolon" = "exec notify-send \"$(date)\"";

        "Mod4+p" = "exec wpctl set-volume @DEFAULT_SINK@ 0.02+";
        "Mod4+o" = "exec wpctl set-volume @DEFAULT_SINK@ 0.02-";

        "Mod4+1" = "workspace number 1";
        "Mod4+a" = "workspace number 1";
        "Mod4+2" = "workspace number 2";
        "Mod4+s" = "workspace number 2";
        "Mod4+3" = "workspace number 3";
        "Mod4+d" = "workspace number 3";
        "Mod4+4" = "workspace number 4";
        "Mod4+f" = "workspace number 4";
        "Mod4+5" = "workspace number 5";
        "Mod4+g" = "workspace number 5";

        "Mod4+Shift+1" = "move container to workspace number 1";
        "Mod4+Shift+a" = "move container to workspace number 1";
        "Mod4+Shift+2" = "move container to workspace number 2";
        "Mod4+Shift+s" = "move container to workspace number 2";
        "Mod4+Shift+3" = "move container to workspace number 3";
        "Mod4+Shift+d" = "move container to workspace number 3";
        "Mod4+Shift+4" = "move container to workspace number 4";
        "Mod4+Shift+f" = "move container to workspace number 4";
        "Mod4+Shift+5" = "move container to workspace number 5";
        "Mod4+Shift+g" = "move container to workspace number 5";
      };
      terminal = "alacritty";
      menu = "wofi --show run";
      bars = [ ];
      # Status bar(s)
      # bars = [{
      #   fonts.size = 15.0;
      #   # command = "waybar"; You can change it if you want
      #   statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-default.toml";
      #   position = "bottom";
      #   colors = {
      #     background = "#ffffff";
      #     statusline = "#ffffff";
      #     active_workspace = "#ffffff";
      #   };
      # }];
      # Display device configuration
      output = {
        eDP-1 = {
          # Set HIDP scale (pixel integer scaling)
          scale = "1";
          mode = "1920x1080";
        };

        DP-1 = {
          bg = "#ffffff solid_color";
        };
      };
    };
  };
}
