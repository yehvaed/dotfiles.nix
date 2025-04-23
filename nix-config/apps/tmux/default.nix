{ lib, ... }: {
  nix-config.apps.tmux = {
    home = { pkgs, ... }@inputs: {
      programs.tmux = {
        plugins = (import ./plugins/loader.nix inputs) (
          with pkgs.tmuxPlugins; [ 
            #themes
            catppuccin

            # sections
            battery 
          ]
        );

        terminal = "tmux-256color";
        historyLimit = 100000;

        enable = true;
      };

      home.packages = with pkgs; [ acpi ];
    };

    tags = [ "dev" ];
  };
}
