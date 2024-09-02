{
  config,
  ...
}: {
  imports = [ ./functions ];

  programs.fish = {
    enable = true;
    catppuccin.enable = true;
    shellAliases = {
      cl = "clear";
      conf = "cd ~/.config";
      nixos = "cd /etc/nixos";
      store = "cd /nix/store";
      projects = "cd ~/Projects";
      nfu = "nixos && nix flake update";
      nfuc = "nixos && nix flake lock --update-input"; 
      nrs = "nh os switch -a path:/etc/nixos";
      nrsr = "nrs && systemctl reboot";
      nrss = "nrs && systemctl poweroff";
      nrsu = "nh os boot -a -u path:/etc/nixos";
      nrsur = "nrsu && systemctl reboot";
      nrsus = "nrsu && systemctl poweroff";
      nsgc = "sudo nix-store --gc";
      ngc = "sudo nix-collect-garbage -d";
      lock = "hyprctl dispatch exec hyprlock";
      unlock = "pkill -USR1 hyprlock";
      nixbtw = "fastfetch";
      nixvim = "nvim";
      npm = "pnpm";
      npx = "pnpx";
      weather = "fastfetch --structure \"weather\" --logo none --separator \": \"";
    };
    shellInit = ''
      set -gx EDITOR vi
      set -gx VOLUME_STEP 5
      set -gx BRIGHTNESS_STEP 5

      set -gx PATH $HOME/.cargo/bin $PATH

      set fish_vi_force_cursor
      set fish_cursor_default block
      set fish_cursor_insert line blink
      set fish_cursor_visual underscore blink

      # set -Ux FZF_DEFAULT_OPTS "\
      # --color=bg+:#${config.theme.colors.surface0},bg:#${config.theme.colors.base},spinner:#${config.theme.colors.rosewater},hl:#${config.theme.colors.red} \
      # --color=fg:#${config.theme.colors.text},header:#${config.theme.colors.red},info:#${config.theme.colors.mauve},pointer:#${config.theme.colors.rosewater} \
      # --color=marker:#${config.theme.colors.rosewater},fg+:#${config.theme.colors.text},prompt:#${config.theme.colors.mauve},hl+:#${config.theme.colors.red}"

      starship init fish | source
    '';
    functions.fish_greeting.body = '''';
  };
}
