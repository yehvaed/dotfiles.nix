{
  nix-config.apps.sudo = {
    nixos = {
      security.sudo.enable = true;
      security.sudo.wheelNeedsPassword = false;
    };

    tags = [ "default" ];
  };
}
