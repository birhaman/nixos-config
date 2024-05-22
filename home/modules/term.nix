{ config, pkgs, lib, home-manager, ... }: {
  home-manager.users.dvm0 = {
    home.packages = with pkgs; [
      yazi wezterm st
      atuin
      stow tuckr

      zsh zi zinit oh-my-zsh zsh-prezto
      nix-your-shell nix-zsh-completions
      tmux tmux-xpanes

      aerc alpine notmuch lumail meli
      rtorrent
      ncmpcpp

      nb
      bartib timetrap
      haskellPackages.hledger hledger-utils

      metar

      ticker
      cointop

      fastfetch screenfetch
      blahaj
    ];
  };

  programs.tmux = {
    enable = true;
    extraConfig = ''
     set -g status-right '#[fg=black,bg=color15] #{cpu_percentage}  %H:%M '
     run-shell ${pkgs.tmuxPlugins.cpu}/share/tmux-plugins/cpu/cpu.tmux
    '';
  };

}
