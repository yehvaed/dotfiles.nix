{ lib, ... }:
let
  inherit (builtins)
    concatLists attrValues isAttr filter readDir match map exec;
  inherit (lib.filesystem) listFilesRecursive;
  inherit (lib.strings) removePrefix hasSuffix;
  inherit (lib) findFirst any;

  matchPattern = file: any (pattern: hasSuffix pattern file) [ ".tmux" ];

  findPluginFile = plugin:
    let
      files = map (file: removePrefix plugin.outPath file)
        (listFilesRecursive plugin.outPath);
    in findFirst matchPattern "" files;

  usePlugin = plugin: "run ${plugin}${findPluginFile plugin}";

in {
  nix-config.apps.tmux = {
    home = { pkgs, ... }@inputs: {
      programs.tmux = {
        plugins = with pkgs.tmuxPlugins; [
          # bottom bar sections
          cpu
          battery
        ];

        extraConfig = with pkgs.tmuxPlugins; ''
          set -g @catppuccin_flavor "mocha"
          set -g @catppuccin_window_status_style "rounded"

          ${usePlugin catppuccin}

          set -g status-right-length 100
          set -g status-left-length 100
          set -g status-left ""
          set -g status-right "#{E:@catppuccin_status_application}"
          set -agF status-right "#{E:@catppuccin_status_cpu}"
          set -ag status-right "#{E:@catppuccin_status_session}"
          set -ag status-right "#{E:@catppuccin_status_uptime}"
          set -agF status-right "#{E:@catppuccin_status_battery}"

          ${usePlugin cpu}
          ${usePlugin battery}
        '';

        terminal = "tmux-256color";
        historyLimit = 100000;

        enable = true;
      };
    };

    tags = [ "dev" ];
  };
}
