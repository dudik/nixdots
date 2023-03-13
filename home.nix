{ config, pkgs, pkgs-unstable, ... }:

{
  home.username = "samuel";
  home.homeDirectory = "/home/samuel";

  home.packages = with pkgs; [
    dmenu
    pcmanfm
    pavucontrol
    ripgrep
    vim
    signal-desktop
    libreoffice
    xarchiver
    libnotify

    jetbrains-mono
    montserrat
    lato
    inter
    roboto

    btop
    lxtask
    eva
    fd
    tokei
    vulnix

    calcurse
    chromium

    flameshot
    xorg.xbacklight
  ];

  home.stateVersion = "22.11";

  programs.home-manager.enable = true;

  programs.feh.enable = true;

  programs.broot.enable = true;

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

  programs.zathura.enable = true;

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
  };

  programs.helix = {
    enable = true;
    package = pkgs-unstable.helix;
    settings = {
      theme = "gruvbox";

      editor = {
        cursorline = true;
        bufferline = "multiple";
        idle-timeout = 300;
        true-color = true;

        indent-guides = {
          render = true;
        };

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };

      };
    };

    languages = [
      {
        name = "python";
        language-server = {
          command = "pyright-langserver";
          args = [ "--stdio" ];
        };
        config = { };
        formatter = {
          command = "black";
          args = [ "--quiet" "-" ];
        };
        auto-format = true;
      }
    ];

  };

  programs.exa = {
    enable = true;
    enableAliases = true;
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
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

      # Colors (Gruvbox dark)
      colors = {
        # Default colors
        primary = {
          # hard contrast: background = '0x1d2021'
          background = "0x282828";
          # soft contrast: background = '0x32302f'
          foreground = "0xebdbb2";
        };

        # Normal colors
        normal = {
          black = "0x282828";
          red = "0xcc241d";
          green = "0x98971a";
          yellow = "0xd79921";
          blue = "0x458588";
          magenta = "0xb16286";
          cyan = "0x689d6a";
          white = "0xa89984";
        };

        # Bright colors
        bright = {
          black = "0x928374";
          red = "0xfb4934";
          green = "0xb8bb26";
          yellow = "0xfabd2f";
          blue = "0x83a598";
          magenta = "0xd3869b";
          cyan = "0x8ec07c";
          white = "0xebdbb2";
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
    extraConfig = ''
      # gruvbox dark hard qutebrowser theme by Florian Bruhin <me@the-compiler.org>
      #
      # Originally based on:
      #   base16-qutebrowser (https://github.com/theova/base16-qutebrowser)
      #   Base16 qutebrowser template by theova and Daniel Mulford
      #   Gruvbox dark, hard scheme by Dawid Kurek (dawikur@gmail.com), morhetz (https://github.com/morhetz/gruvbox)

      bg0_hard = "#1d2021"
      bg0_soft = '#32302f'
      bg0_normal = '#282828'

      bg0 = bg0_normal
      bg1 = "#3c3836"
      bg2 = "#504945"
      bg3 = "#665c54"
      bg4 = "#7c6f64"

      fg0 = "#fbf1c7"
      fg1 = "#ebdbb2"
      fg2 = "#d5c4a1"
      fg3 = "#bdae93"
      fg4 = "#a89984"

      bright_red = "#fb4934"
      bright_green = "#b8bb26"
      bright_yellow = "#fabd2f"
      bright_blue = "#83a598"
      bright_purple = "#d3869b"
      bright_aqua = "#8ec07c"
      bright_gray = "#928374"
      bright_orange = "#fe8019"

      dark_red = "#cc241d"
      dark_green = "#98971a"
      dark_yellow = "#d79921"
      dark_blue = "#458588"
      dark_purple = "#b16286"
      dark_aqua = "#689d6a"
      dark_gray = "#a89984"
      dark_orange = "#d65d0e"

      ### Completion

      # Text color of the completion widget. May be a single color to use for
      # all columns or a list of three colors, one for each column.
      c.colors.completion.fg = [fg1, bright_aqua, bright_yellow]

      # Background color of the completion widget for odd rows.
      c.colors.completion.odd.bg = bg0

      # Background color of the completion widget for even rows.
      c.colors.completion.even.bg = c.colors.completion.odd.bg

      # Foreground color of completion widget category headers.
      c.colors.completion.category.fg = bright_blue

      # Background color of the completion widget category headers.
      c.colors.completion.category.bg = bg1

      # Top border color of the completion widget category headers.
      c.colors.completion.category.border.top = c.colors.completion.category.bg

      # Bottom border color of the completion widget category headers.
      c.colors.completion.category.border.bottom = c.colors.completion.category.bg

      # Foreground color of the selected completion item.
      c.colors.completion.item.selected.fg = fg0

      # Background color of the selected completion item.
      c.colors.completion.item.selected.bg = bg4

      # Top border color of the selected completion item.
      c.colors.completion.item.selected.border.top = bg2

      # Bottom border color of the selected completion item.
      c.colors.completion.item.selected.border.bottom = c.colors.completion.item.selected.border.top

      # Foreground color of the matched text in the selected completion item.
      c.colors.completion.item.selected.match.fg = bright_orange

      # Foreground color of the matched text in the completion.
      c.colors.completion.match.fg = c.colors.completion.item.selected.match.fg

      # Color of the scrollbar handle in the completion view.
      c.colors.completion.scrollbar.fg = c.colors.completion.item.selected.fg

      # Color of the scrollbar in the completion view.
      c.colors.completion.scrollbar.bg = c.colors.completion.category.bg

      ### Context menu

      # Background color of disabled items in the context menu.
      c.colors.contextmenu.disabled.bg = bg3

      # Foreground color of disabled items in the context menu.
      c.colors.contextmenu.disabled.fg = fg3

      # Background color of the context menu. If set to null, the Qt default is used.
      c.colors.contextmenu.menu.bg = bg0

      # Foreground color of the context menu. If set to null, the Qt default is used.
      c.colors.contextmenu.menu.fg =  fg2

      # Background color of the context menu’s selected item. If set to null, the Qt default is used.
      c.colors.contextmenu.selected.bg = bg2

      #Foreground color of the context menu’s selected item. If set to null, the Qt default is used.
      c.colors.contextmenu.selected.fg = c.colors.contextmenu.menu.fg

      ### Downloads

      # Background color for the download bar.
      c.colors.downloads.bar.bg = bg0

      # Color gradient start for download text.
      c.colors.downloads.start.fg = bg0

      # Color gradient start for download backgrounds.
      c.colors.downloads.start.bg = bright_blue

      # Color gradient end for download text.
      c.colors.downloads.stop.fg = c.colors.downloads.start.fg

      # Color gradient stop for download backgrounds.
      c.colors.downloads.stop.bg = bright_aqua

      # Foreground color for downloads with errors.
      c.colors.downloads.error.fg = bright_red

      ### Hints

      # Font color for hints.
      c.colors.hints.fg = bg0

      # Background color for hints.
      c.colors.hints.bg = 'rgba(250, 191, 47, 200)'  # bright_yellow

      # Font color for the matched part of hints.
      c.colors.hints.match.fg = bg4

      ### Keyhint widget

      # Text color for the keyhint widget.
      c.colors.keyhint.fg = fg4

      # Highlight color for keys to complete the current keychain.
      c.colors.keyhint.suffix.fg = fg0

      # Background color of the keyhint widget.
      c.colors.keyhint.bg = bg0

      ### Messages

      # Foreground color of an error message.
      c.colors.messages.error.fg = bg0

      # Background color of an error message.
      c.colors.messages.error.bg = bright_red

      # Border color of an error message.
      c.colors.messages.error.border = c.colors.messages.error.bg

      # Foreground color of a warning message.
      c.colors.messages.warning.fg = bg0

      # Background color of a warning message.
      c.colors.messages.warning.bg = bright_purple

      # Border color of a warning message.
      c.colors.messages.warning.border = c.colors.messages.warning.bg

      # Foreground color of an info message.
      c.colors.messages.info.fg = fg2

      # Background color of an info message.
      c.colors.messages.info.bg = bg0

      # Border color of an info message.
      c.colors.messages.info.border = c.colors.messages.info.bg

      ### Prompts

      # Foreground color for prompts.
      c.colors.prompts.fg = fg2

      # Border used around UI elements in prompts.
      c.colors.prompts.border = f'1px solid {bg1}'

      # Background color for prompts.
      c.colors.prompts.bg = bg3

      # Background color for the selected item in filename prompts.
      c.colors.prompts.selected.bg = bg2

      ### Statusbar

      # Foreground color of the statusbar.
      c.colors.statusbar.normal.fg = fg2

      # Background color of the statusbar.
      c.colors.statusbar.normal.bg = bg0

      # Foreground color of the statusbar in insert mode.
      c.colors.statusbar.insert.fg = bg0

      # Background color of the statusbar in insert mode.
      c.colors.statusbar.insert.bg = dark_aqua

      # Foreground color of the statusbar in passthrough mode.
      c.colors.statusbar.passthrough.fg = bg0

      # Background color of the statusbar in passthrough mode.
      c.colors.statusbar.passthrough.bg = dark_blue

      # Foreground color of the statusbar in private browsing mode.
      c.colors.statusbar.private.fg = bright_purple

      # Background color of the statusbar in private browsing mode.
      c.colors.statusbar.private.bg = bg0

      # Foreground color of the statusbar in command mode.
      c.colors.statusbar.command.fg = fg3

      # Background color of the statusbar in command mode.
      c.colors.statusbar.command.bg = bg1

      # Foreground color of the statusbar in private browsing + command mode.
      c.colors.statusbar.command.private.fg = c.colors.statusbar.private.fg

      # Background color of the statusbar in private browsing + command mode.
      c.colors.statusbar.command.private.bg = c.colors.statusbar.command.bg

      # Foreground color of the statusbar in caret mode.
      c.colors.statusbar.caret.fg = bg0

      # Background color of the statusbar in caret mode.
      c.colors.statusbar.caret.bg = dark_purple

      # Foreground color of the statusbar in caret mode with a selection.
      c.colors.statusbar.caret.selection.fg = c.colors.statusbar.caret.fg

      # Background color of the statusbar in caret mode with a selection.
      c.colors.statusbar.caret.selection.bg = bright_purple

      # Background color of the progress bar.
      c.colors.statusbar.progress.bg = bright_blue

      # Default foreground color of the URL in the statusbar.
      c.colors.statusbar.url.fg = fg4

      # Foreground color of the URL in the statusbar on error.
      c.colors.statusbar.url.error.fg = dark_red

      # Foreground color of the URL in the statusbar for hovered links.
      c.colors.statusbar.url.hover.fg = bright_orange

      # Foreground color of the URL in the statusbar on successful load
      # (http).
      c.colors.statusbar.url.success.http.fg = bright_red

      # Foreground color of the URL in the statusbar on successful load
      # (https).
      c.colors.statusbar.url.success.https.fg = fg0

      # Foreground color of the URL in the statusbar when there's a warning.
      c.colors.statusbar.url.warn.fg = bright_purple

      ### tabs

      # Background color of the tab bar.
      c.colors.tabs.bar.bg = bg0

      # Color gradient start for the tab indicator.
      c.colors.tabs.indicator.start = bright_blue

      # Color gradient end for the tab indicator.
      c.colors.tabs.indicator.stop = bright_aqua

      # Color for the tab indicator on errors.
      c.colors.tabs.indicator.error = bright_red

      # Foreground color of unselected odd tabs.
      c.colors.tabs.odd.fg = fg2

      # Background color of unselected odd tabs.
      c.colors.tabs.odd.bg = bg2

      # Foreground color of unselected even tabs.
      c.colors.tabs.even.fg = c.colors.tabs.odd.fg

      # Background color of unselected even tabs.
      c.colors.tabs.even.bg = bg3

      # Foreground color of selected odd tabs.
      c.colors.tabs.selected.odd.fg = fg2

      # Background color of selected odd tabs.
      c.colors.tabs.selected.odd.bg = bg0

      # Foreground color of selected even tabs.
      c.colors.tabs.selected.even.fg = c.colors.tabs.selected.odd.fg

      # Background color of selected even tabs.
      c.colors.tabs.selected.even.bg = bg0

      # Background color of pinned unselected even tabs.
      c.colors.tabs.pinned.even.bg = bright_green

      # Foreground color of pinned unselected even tabs.
      c.colors.tabs.pinned.even.fg = bg2

      # Background color of pinned unselected odd tabs.
      c.colors.tabs.pinned.odd.bg = bright_green

      # Foreground color of pinned unselected odd tabs.
      c.colors.tabs.pinned.odd.fg = c.colors.tabs.pinned.even.fg

      # Background color of pinned selected even tabs.
      c.colors.tabs.pinned.selected.even.bg = bg0

      # Foreground color of pinned selected even tabs.
      c.colors.tabs.pinned.selected.even.fg = c.colors.tabs.selected.odd.fg

      # Background color of pinned selected odd tabs.
      c.colors.tabs.pinned.selected.odd.bg = c.colors.tabs.pinned.selected.even.bg

      # Foreground color of pinned selected odd tabs.
      c.colors.tabs.pinned.selected.odd.fg = c.colors.tabs.selected.odd.fg

      # Background color for webpages if unset (or empty to use the theme's
      # color).
      # c.colors.webpage.bg = bg4
    '';
  };

  programs.brave.enable = true;
  programs.librewolf.enable = true;
  programs.mpv = {
    enable = true;
    config = {
      fullscreen = true;
      ytdl-format = "bestvideo[height<=?1080]+bestaudio/best";
      osd-font = "Roboto";
      sub-font = "Roboto";
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
        syntax-theme = "gruvbox-dark";
      };
    };
    userName = "Samuel Dudík";
    userEmail = "24730635+dudik@users.noreply.github.com";
  };

  programs.bash.enable = true;
  programs.bash.profileExtra = ''
    if [ -z $DISPLAY ] && [ $XDG_VTNR -eq 1 ]; then
      exec startx
    fi
  '';

  # TODO Remove after figuring out automounting in a different way
  services.udiskie.enable = true;

  services.redshift = {
    enable = true;
    # Trnava
    latitude = 48.37741;
    longitude = 17.58723;
  };

  services.dunst.enable = true;

  services.unclutter = {
    enable = true;
    timeout = 5;
  };

  services.xidlehook = {
    enable = true;
    not-when-audio = true;
    timers = [
      {
        delay = 60 * 6;
        command = "systemctl suspend";
      }
    ];
  };

  services.sxhkd = {
    enable = true;
    keybindings = {
      "alt + Return" = "alacritty";
      "alt + q" = "dmenu_run -nb '#282828' -nf '#A89984' -sb '#1D2021' -fn 'JetBrains Mono NL:style=Regular:size=11'";
      "alt + b" = "qutebrowser";

      "alt + {_,shift + } a" = "bspc {desktop -f,node -d} 1";
      "alt + {_,shift + } s" = "bspc {desktop -f,node -d} 2";
      "alt + {_,shift + } d" = "bspc {desktop -f,node -d} 3";
      "alt + {_,shift + } f" = "bspc {desktop -f,node -d} 4";
      "alt + {_,shift + } g" = "bspc {desktop -f,node -d} 5";

      "alt + {_,shift + } 1" = "bspc {desktop -f,node -d} 1";
      "alt + {_,shift + } 2" = "bspc {desktop -f,node -d} 2";
      "alt + {_,shift + } 3" = "bspc {desktop -f,node -d} 3";
      "alt + {_,shift + } 4" = "bspc {desktop -f,node -d} 4";
      "alt + {_,shift + } 5" = "bspc {desktop -f,node -d} 5";

      "alt + {grave,Tab}" = "bspc {node,desktop} -f last";

      "alt + {_,shift + } w" = "bspc node -{c,k}";

      # focus the next/previous window in the current desktop
      "alt + {_,shift + } c" = "bspc node -f {next,prev}.local.!hidden.window";

      # alternate between the tiled and monocle layout
      "alt + m" = "bspc desktop -l next";

      # make sxhkd reload its configuration files
      "alt + Escape" = "pkill -USR1 -x sxhkd";

      "alt + z" = "setxkbmap {us, sk qwerty}";

      # Toggle mute
      "XF86AudioMute" = "wpctl set-mute @DEFAULT_SINK@ toggle";

      # Toggle mute
      "alt + i" = "wpctl set-mute @DEFAULT_SINK@ toggle";

      # Toggle mic mute
      # "XF86AudioMicMute" = "pactl set-source-mute @DEFAULT_SOURCE@ toggle";

      # Change volume
      "XF86Audio{Raise,Lower}Volume" = "wpctl set-volume @DEFAULT_SINK@ 0.02{+,-}";

      # Change volume
      "alt + {p,o}" = "wpctl set-volume @DEFAULT_SINK@ 0.02{+,-}";

      # Change volume, chunky
      "alt + shift + {p,o}" = "wpctl set-volume @DEFAULT_SINK@ {+,-}10%";

      "alt + t" = "{ bspc config right_padding 0 && bspc config left_padding 0, bspc config right_padding 300 && bspc config left_padding 300 }";
    };
  };

  xsession.enable = true;
  xsession.scriptPath = ".xinitrc";
  xsession.initExtra = ''
    if xrandr | grep -q "HDMI1 connected"; then
      xrandr --output eDP1 --off
    else
      echo "Xft.dpi: 115" | xrdb
    fi

    xsetroot -solid "#282828"

    rm /tmp/nesed.ipc
    /home/samuel/Desktop/work/nesed/target/debug/nesed test &
  '';
  xsession.windowManager.bspwm = {
    enable = true;
    startupPrograms = [ "systemctl --user restart polybar" ];
    rules = {
      "Zathura" = {
        state = "tiled";
      };
    };
    monitors = {
      HDMI1 = [
        "1"
        "2"
        "3"
        "4"
        "5"
      ];
      eDP1 = [
        "1"
        "2"
        "3"
        "4"
        "5"
      ];
    };
    settings = {
      border_width = 1;
      window_gap = 0;

      split_ratio = 0.5;
      borderless_monocle = true;
      gapless_monocle = true;

      single_monocle = true;

      focus_follows_pointer = true;

      right_padding = 300;
      left_padding = 300;
    };
  };

  services.polybar = {
    enable = true;
    script = "polybar &";
    settings = {
      "bar/main" = {
        padding-right = 1;
        background = "#282828";
        foreground = "#EBDBB2";
        bottom = true;
        width = "100%";
        height = "18pt";
        modules-left = "xworkspaces xwindow";
        modules-right = "nesed alsa battery date";
        font-0 = "JetBrains Mono NL:size=11; 3";
        separator = "|";
        module-margin = 1;
      };

      "module/xworkspaces" = {
        type = "internal/xworkspaces";
        # label-focused-background = "#1D2021";
        label-focused = " %name% ";
        label-unfocused = " %name% ";
        label-visible = " %name% ";
        label-urgent = " %name% ";
        label-occupied = " %name% ";
        label-dimmed = " %name% ";
        label-empty = " %name% ";
        label-empty-foreground = "#928374";
        label-active = " %name% ";
        label-active-background = "#1D2021";
      };

      "module/xwindow" = {
        type = "internal/xwindow";
        # label = %title:0:80:...%
      };

      "module/nesed" = {
        type = "custom/script";
        exec = "/home/samuel/Desktop/work/nesed/target/debug/nesed";
        interval = 5;
      };

      "module/alsa" = {
        type = "internal/alsa";
        format-volume-prefix = "VOL ";
        label-muted = "VOL MUT";
      };

      "module/memory" = {
        type = "internal/memory";
        interval = 2;
        format-prefix = "RAM ";
      };

      "module/cpu" = {
        type = "internal/cpu";
        interval = 2;
        format-prefix = "CPU ";
      };

      "module/battery" = {
        type = "internal/battery";

        label-full = "BAT %percentage%%";
        label-charging = "BAT CHAR %percentage%% %time%";
        label-discharging = "BAT DIS %percentage%% %time%";
        time-format = "%H:%M";

        full-at = 50;
        low-at = 10;

        battery = "BAT0";
        adapter = "AC";

        poll-interval = 10;
      };

      "module/date" = {
        type = "internal/date";
        # interval = 1

        date = "%a %d %b %H:%M";
        date-alt = "%a %d %b %H:%M:%S";

        label = "%date%";
      };
    };
  };
}
