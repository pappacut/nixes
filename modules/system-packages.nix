{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    deploy-rs
    e2fsprogs

    # Runtimes
    nodejs_latest
    deno

    # Development Tools
    podman-compose
    dbeaver-bin
    rustup
    gcc

    # Other Software
    ffmpeg
    gimp
    rclone
    remmina
    signal-desktop
    transmission_4-gtk
    rustdesk-flutter
  ];
}
