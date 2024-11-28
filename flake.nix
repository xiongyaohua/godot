# 供nixos环境下使用
# 用法：
# 1. 命令行切换到当前目录
# 2. nix-shell，进入开发环境
# 3. jupyter server，启动jupyter服务器
# 4. 在vscode里面连接该服务器
#
# TODO：调查为什么直接从vscode里面启动服务器会出错。

let
  pkgs = import <nixos-unstable> {};
in pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    pkg-config
    autoPatchelfHook
    wayland-scanner
    ];
  runtimeDependencies = with pkgs; [
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
  buildInputs = with pkgs; [
    scons
    git
    openssh
  ];
}

