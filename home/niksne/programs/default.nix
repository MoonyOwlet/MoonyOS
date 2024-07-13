{
  pkgs, 
  npkgs,
  inputs,
  ...
}: {
  imports = [
    ./browsers
    ./editors
    ./media
    ./office
    ./social
    ./wayland
    ./gtk.nix
    ./qt.nix
  ];

  programs.java = {
    enable = true;
    package = pkgs.zulu17;
  }; 

  home.packages = with inputs; [
    catppuccin-whiskers.packages.${pkgs.system}.whiskers
    catppuccin-catwalk.packages.${pkgs.system}.catwalk
  ] ++ (with pkgs; [
    gnome.file-roller
    swww
    
    qbittorrent
    tmux
    gparted
    authenticator
    blockbench

    mission-center
    wineWowPackages.waylandFull
    mono
  ]) ++ (with npkgs; [
    catppuccin
  ]);
}
