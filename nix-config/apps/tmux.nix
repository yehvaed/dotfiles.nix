{
  nix-config.apps.tmux = {
    home = { pkgs, ... }@inputs: {
      programs.tmux = {
        terminal = "tmux-256color";
        historyLimit = 100000;

        enable = true;
      };
    };

    tags = [ "dev" ];
  };
}
