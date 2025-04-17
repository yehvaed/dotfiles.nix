{
  nix-config.apps.neovim = {
    home = { pkgs, ... }@inputs: {
        programs.neovim = {
          plugins = (import ./plugins/loader.nix inputs) (
              with pkgs.vimPlugins; [
              # ==> @editor/lsp
              nvim-cmp
              nvim-lspconfig
              luasnip
              cmp-nvim-lsp
              cmp_luasnip

              # ==> @editor/treesitter
              nvim-treesitter.withAllGrammars

              # ==> @editor
              neo-tree-nvim
              trouble-nvim

              # ==> @pickers
              fzf-lua

              # ==> @theme
              neovim-ayu

              # ==> @tools
              neorg
            ]
          );

          extraConfig = ''
            let mapleader = " "
            set tabstop=2 softtabstop=2
            set shiftwidth=2
            set expandtab
            set smartindent
            set number
          '';

          viAlias = true;
          vimAlias = true;

          enable = true;
        };
      };

    nixos = { environment.variables = { EDITOR = "nvim"; }; };

    tags = [ "dev" ];
  };
}
