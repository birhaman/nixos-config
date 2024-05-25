{ config, pkgs, lib, home-manager, ... }: {
  home-manager.users.dvm0 = {
    home.packages = with pkgs; [
      yazi wezterm st
      atuin
      stow tuckr

      zsh zi zinit oh-my-zsh zsh-prezto
      nix-your-shell nix-zsh-completions
      tmux tmux-xpanes

      # Binutils spicy als
      eza dtrx fd bfs xcp broot plocate
      ydiff dyff dirdiff
      du-dust dfc
      busybox

      zee vis ox
      yai
      fasd delta rm-improved lsd massren

      autorestic zbackup

      # Email
      aerc alpine notmuch lumail meli
      tmpmail
      bfg-repo-cleaner

      # Messengers
      pingme
      scli
      weechat
      weechatScripts.weechat-matrix

      rtorrent
      ncmpcpp

      bcal

      haskellPackages.hledger hledger-utils invoice
      ticker cointop

      nb bartib timetrap
      metar

      # Osint
      asn

      sops

      # Converters
      imagemagick


      iredis

      fastfetch screenfetch
      daktilo
      blahaj nms neo
      pokemonsay pokeget-rs pokete
      toilet


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
