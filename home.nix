{ pkgs, ...}:

{
  programs.home-manager.enable = true;
  programs.home-manager.path = https://github.com/rycee/home-manager/archive/release-18.03.tar.gz;
  
  home.file = {
    "dotfiles" = {
        source = ./dotfiles;
        recursive = true;
    };
    ".emacs.d" = {
	source = ./dotfiles/configs/link/emacs.d;
        recursive = true;
    };
    ".docker" = {
	source = ./dotfiles/configs/link/docker;
        recursive = true;
    };
    ".sbt" = {
	source = ./dotfiles/configs/link/sbt;
        recursive = true;
    };
    ".ctags" = {
	source = ./dotfiles/configs/link/ctags;
        recursive = false;
    };
    ".tmux-os.conf" = {
	source = ./dotfiles/configs/link/_Linux_tmux-os.conf;
        recursive = false;
    };
    ".agignore" = {
	source = ./dotfiles/configs/link/agignore;
        recursive = false;
    };
    ".gitconfig" = {
	source = ./dotfiles/configs/link/gitconfig;
        recursive = false;
    };
    ".gitignore_global" = {
	source = ./dotfiles/configs/link/gitignore_global;
        recursive = false;
    };
    ".tmux.conf" = {
	source = ./dotfiles/configs/link/tmux.conf;
        recursive = false;
    };
    ".zshrc" = {
	source = ./dotfiles/configs/link/zshrc;
        recursive = false;
    };
  };
}
