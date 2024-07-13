let
    pkgs = import <nixpkgs> { };
in
derivation {
    name = "simple";
    builder = "${pkgs.bash}/bin/bash";
    args = [ ./simple_builder.sh ];
    inherit (pkgs) gcc coreutils;
    src = ./simple.c;
    system = builtins.currentSystem;
}
