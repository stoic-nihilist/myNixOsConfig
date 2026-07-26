# /etc/nixos/overlays/bitwig.nix
final: prev: {
  bitwig-studio = prev.bitwig-studio.overrideAttrs (old: {
    postFixup = (old.postFixup or "") + ''
      cp ${./bitwig.jar} $out/libexec/bin/bitwig.jar
    '';
  });
}
