{
  description = "flake for parrot os clone";

  inputs.nixpkgs.url = github:NixOS/nixpkgs;
  inputs.hackpkgs.url = github:applePrincess/hackpkgs;

  outputs = { self, nixpkgs, hackpkgs }: {
    nixosConfigurations.parrot = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      environment.systemPackages = with pkgs; [
        libeatmydata

        # # installer
        # debian-installer-launcher
        # calamares-settings-parrot

        # virtualization
        open-vm-tools

        # important stuff
        # locales
        # locales-all
        cryptosetup
        iw
        lvm2
        mdadm
        parted
        gpart
        bash-completion
        # resolvconf # TODO
        rng-tools5
        haveged
        neovim
        inxi
        htop
        nload
        # gufw # TODO

        #security TODO
        # apparmor
        # apparmor-profiles
        # apparmor-profiles-extra
        # apparmor-utils
        # apparmor-easyprof
        # apparmor-notify

        #filesystem support
        jfsutils
        # hfsplus # TODO
        # hfsutils # TODO
        btrfsProgs
        e2fsprogs
        dosfstools
        mtools
        reiser4progs
        reiserfsprogs
        xfsprogs
        # xfsdump # TODO
        ntfs3g
        # libfsapfs1 # TODO
        # libfsapfs-utils # TODO

        ## parrot metapackages
        parrot-interface
        parrot-interface-full
        parrot-mate
        parrot-tools-full
        parrot-drivers
        parrot-crypto
        parrot-privacy
        parrot-devel

        firefox

        ## other packages
        telnet
        # rizin-cutter # TODO
      ];
    };

    programs.zsh = {
      enable = true;
      syntaxHighlighting.enable = true;
      enableCompletion = true;
      # TODO
      # zsh-autocomplete
    };

    programs.bash = {
      enable = true;
    };
  };
}
