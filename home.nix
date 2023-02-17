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

    calcurse
  ];

  home.stateVersion = "22.11";

  programs.home-manager.enable = true;

  programs.autorandr =
    {
      enable = true;
      profiles = {
        "work" = {
          fingerprint = {
            "eDP-1" = "00ffffffffffff0009e5420700000000201b0104a51f1178025510975d5992291f5054000000010101010101010101010101010101013c3780de703814403020360035ad1000001a000000000000000000000000000000000000000000fe00424f452043510a202020202020000000fe004e5631343046484d2d4e34390a004b";
            "HDMI-1" = "00ffffffffffff000469f4270101010127150103803c2278eee980a555489b26125054bfef00714f818081409500a940b30081c00101023a801871382d40582c450056502100001a000000fd00384c1f5311000a202020202020000000fc00415355532032375431450a2020000000ff0042394c5651533035313633370a01f8020320f14d900504030201111213141f0716230907078301000065030c001000023a801871382d40582c450056502100001f011d8018711c1620582c250056502100009f011d007251d01e206e28550056502100001f011d80d0721c1620102c258056502100009d011d00bc52d01e20b828554056502100001e00000000004a";
          };
          config = {
            "HDMI-1" = {
              mode = "1920x1080";
              enable = true;
            };
            "eDP-1" = {
              enable = false;
            };
          };
          # hooks.postswitch = readFile ./work-postswitch.sh;
        };
      };
    };

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
  };

  programs.qutebrowser = {
    enable = true;
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
  programs.yt-dlp.enable = true;
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
    userName = "Samuel Dudík";
    userEmail = "24730635+dudik@users.noreply.github.com";
  };

  programs.bash.enable = true;
  programs.bash.profileExtra = ''
    if [ -z $DISPLAY ] && [ $XDG_VTNR -eq 1 ]; then
      exec startx
    fi
  '';

  # TODO remove
  # services.udiskie.enable = true;
  # services.picom.enable = true;

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
      "alt + {_,shift + } a" = "bspc {desktop -f,node -d} 1";
      "alt + {_,shift + } s" = "bspc {desktop -f,node -d} 2";
      "alt + {_,shift + } d" = "bspc {desktop -f,node -d} 3";
      "alt + {_,shift + } f" = "bspc {desktop -f,node -d} 4";
      "alt + {_,shift + } g" = "bspc {desktop -f,node -d} 5";
      "alt + {_,shift + } w" = "bspc node -{c,k}";

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
    xrandr --output eDP-1 --off

    xsetroot -solid "#282828"

    rm /tmp/nesed.ipc
    /home/samuel/Desktop/work/nesed/target/debug/nesed test &
  '';
  xsession.windowManager.bspwm = {
    enable = true;
    monitors = {
      HDMI-1 = [
        "1"
        "2"
        "3"
        "4"
        "5"
      ];
      eDP-1 = [
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
