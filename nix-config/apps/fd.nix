{
  nix-config.apps.fd = {
    home = { programs.fd = { enable = true; }; };

    tags = [ "default" ];
  };
}

