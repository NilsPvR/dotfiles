# Fix according to https://wiki.nixos.org/w/index.php?title=ONLYOFFICE

{ config, pkgs, ... }:

{
    # OnlyOffice font fix
    nixpkgs.overlays = [
        (final: prev: {
            onlyoffice-desktopeditors = prev.buildFHSEnv (
                prev.onlyoffice-desktopeditors.passthru.args
                // {
                    extraBwrapArgs = (prev.onlyoffice-desktopeditors.passthru.args.extraBwrapArgs or [ ]) ++ [
                        # Bind mount host system fonts into the FHS container's /usr/share/fonts:
                        "--ro-bind"
                        "/usr/share/fonts"
                        "/usr/share/fonts"
                    ];
                }
            );
        })
    ];
}
