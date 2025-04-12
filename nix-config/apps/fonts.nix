{
  nix-config.apps.fonts = {
    nixos = { pkgs, ... }: {
      fonts.packages = with pkgs; [
        nerd-fonts.fira-code
      ];
    };

    tags = [ "default" ];
  };
}
