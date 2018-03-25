{ opkgs ? import <nixpkgs> {} }:

let
  pkgs = import (opkgs.fetchFromGitHub {
    owner = "NixOS"; repo = "nixpkgs-channels";
    rev = "aeff3080d02ce6ac2b2ad0b0029c1388eab2d8c7";
    sha256 = "0zbfwlzk17nqckx8z96n205zzl3msczrv87hz9p1qdnxlcibzsvk";
  }) {};
  fixWrapper = pkgs.runCommand "fix-wrapper" {} ''
    mkdir -p $out/bin
    for i in ${pkgs.gcc.cc}/bin/*-gnu-gcc*; do
      ln -s ${pkgs.gcc}/bin/gcc $out/bin/$(basename "$i")
    done
    for i in ${pkgs.gcc.cc}/bin/*-gnu-{g++,c++}*; do
      ln -s ${pkgs.gcc}/bin/g++ $out/bin/$(basename "$i")
    done
  '';

  fhs = pkgs.buildFHSUserEnv {
    name = "openwrt-env";
    targetPkgs = pkgs: with pkgs;
      [ git
        perl
        gnumake
        gcc
        unzip
        utillinux
        python2
        patch
        wget
        file
        subversion
        which
        pkgconfig
        openssl
        fixWrapper
        systemd
        coreutils

        ncurses
        zlib
        zlib.static
        glibc.static
      ];
    multiPkgs = null;
    extraOutputsToInstall = [ "dev" ];
    profile = ''
      export hardeningDisable=all
    '';
  };
in fhs.env
