{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {
    self, nixpkgs
  }: let
    system = "x86_64-linux";
    name = "godot";
    pkgs = import nixpkgs {
      inherit system;
    };
  in
  with pkgs; {
    devShells.${system}.default = mkShell {
      buildInputs = [
        vulkan-loader
        libGL
        xorg.libX11
        xorg.libXcursor
        xorg.libXinerama
        xorg.libXext
        xorg.libXrandr
        xorg.libXi
        xorg.libXfixes
        libxkbcommon
        libpulseaudio
        dbus
        dbus.lib
        fontconfig
        fontconfig.lib
        udev
        alsa-lib
        libdecor
        wayland
        wayland-scanner
        speechd-minimal
      ];

      nativeBuildInputs = [
        pkg-config
        autoPatchelfHook
        wayland-scanner
        scons
        git
        openssh
      ];
    };
  };
}

