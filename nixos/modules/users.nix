{ pkgs, nnr, ...}:

{
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users = {
        niksne = {
            isNormalUser = true;
            description = "NikSne";
            extraGroups = [ "networkmanager" "wheel" "audio" "video" "docker"];
	        shell = pkgs.fish;
            packages = [
                pkgs.authy
                pkgs.vivaldi
                pkgs.vivaldi-ffmpeg-codecs
                
                pkgs.obs-studio
                pkgs.obs-studio-plugins.wlrobs
                pkgs.prismlauncher
                pkgs.spotify
                nnr.spicetify-cli
                pkgs.blockbench-electron

                pkgs.vscodium
                pkgs.github-desktop
                pkgs.neovim
                pkgs.hoppscotch
                pkgs.rpi-imager

                nnr.jetbrains.idea-ultimate
                nnr.jetbrains.pycharm-professional
                nnr.jetbrains.webstorm
                nnr.jetbrains.datagrip
                pkgs.jetbrains.rust-rover
                nnr.jetbrains.clion
                nnr.jetbrains.goland
                nnr.jetbrains.gateway
                nnr.jetbrains.writerside

                pkgs.vesktop
                pkgs.tdesktop
                pkgs.whatsapp-for-linux
            ];
        };
    };
}
