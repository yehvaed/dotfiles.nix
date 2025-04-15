{
  nix-config.apps.nh = {
    home = {
      programs.nh = {
        clean = {
          enable = true;
          extraArgs = "--keep 5 --keep-since 3d";
        };

        enable = true;
      };
    };

    tags = [ "default" ];
  };
}
