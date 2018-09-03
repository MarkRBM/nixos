{ config, pkgs, lib, ... }:

{
  imports = [ <nixpkgs/nixos/modules/installer/virtualbox-demo.nix> ];

  nix = {
    nixPath = [
      "/etc/nixos"
      "nixpkgs=/etc/nixos/nixpkgs"
      "nixos-config=/etc/nixos/configuration.nix"
    ];
    
    gc = {
      automatic = true;
      dates = "20:15";
    };
    useSandbox = true;
    allowedUsers = ["@wheel"];
  };

  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  ## ZSH CONF ##
  programs.zsh.promptInit = "";
  #Force Shellinit text to end
  programs.zsh.interactiveShellInit = lib.mkForce ''
    COMPUTER="heyitnix"
    ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh/
    HISTFILE=$HOME/.config/oh-my-zsh/zsh_history
    ZSH_CUSTOM=$HOME/.config/oh-my-zsh/custom
    ZSH_THEME="af-magic"
    DISABLE_AUTO_UPDATE=true

    plugins=(git history sudo zsh-autosuggestions)

    source $ZSH/oh-my-zsh.sh

    export EDITOR="emacs -nw"

    export PATH="$HOME/.local/bin:$PATH"
  '';

  users.defaultUserShell = pkgs.bashInteractive;

  environment.shells = [pkgs.zsh];
  programs.zsh.enable = true;

  virtualisation.docker.enable = true;

  users.users.mark =
    { isNormalUser = true;
      home = "/home/mark";
      shell = pkgs.zsh;
      description = "Mark Moore";
      extraGroups = ["wheel" "networkmanager" "docker"];
    };

  environment.systemPackages =
    [
      pkgs.vim
      pkgs.emacs
      pkgs.git
      pkgs.oh-my-zsh
      pkgs.tmux
      pkgs.wget  
      pkgs.curl
      pkgs.unzip
      pkgs.docker
      pkgs.quassel
      pkgs.silver-searcher
      #pkgs._1password
    ];
}
  
