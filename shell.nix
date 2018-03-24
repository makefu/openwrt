{ opkgs ? import <nixpkgs> {} }:

let
  pkgs = import (opkgs.fetchFromGitHub {
    owner = "NixOS"; repo = "nixpkgs-channels";
    rev = "bee172501de3b4496ff81cc1621d307f167e9382";
    sha256 = "14jn7jiq4likrm7fry2m3q3rmv3y4xjfnwx13wh6iqd8c3bcjd12";
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
        binutils
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
