{
  nix-config.apps.neovim = {
    home = {
      programs.neovim = {
        plugins = [ ];

        viAlias = true;
        vimAlias = true;

        enable = true;
      };
    };

    nixos = { environment.variables = { EDITOR = "nvim"; }; };

    tags = [ "dev" ];
  };
}
