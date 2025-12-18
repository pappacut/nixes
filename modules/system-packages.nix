{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    nh
    e2fsprogs

    # Runtimes
    nodejs_25
    deno

    # Development Tools
    podman-compose
    dbeaver-bin

    # Other Software
    gimp
  ];
}
