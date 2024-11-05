{ config, pkgs, ... }:

# let
  # home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz";
# in
{
  # imports = [
    # (import "${home-manager}/nixos")
  # ];

  # home-manager.users.sat = { pkgs, ... }: {
    # home.stateVersion = "18.09";
    # programs.home-manager.enable = true;

    # Git config
    # programs.git = {
      # enable = true;
      # userName  = "wise-bit";
      # userEmail = "satrajit2016@gmail.com";
    # };
  # };

  # Zsh config
  programs.zsh = {
    enable = true;
    shellAliases = {
      sedit = "sudo -E vim";
    };
    interactiveShellInit = ''
      PROMPT=$'%{\n%}'$PROMPT
    '';
    ohMyZsh = {
      enable = true;
      theme = "jonathan"; # robbyrussell
      plugins = [ "z" "autojump" ];
    };
  };
}

