{
  nix-config.apps.gnome = {
    nixos = { pkgs, ... }: {
      services.xserver.enable = true;
      services.displayManager.sddm.enable = true;
      services.desktopManager.plasma6.enable = true;

      environment.systemPackages = with pkgs; [ catppuccin-kde ];
    };

    tags = [ "gui" ];
  };
}
