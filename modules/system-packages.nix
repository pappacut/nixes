{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    nh

    # Runtimes
    nodejs_25
    deno

    # Development Tools
    dbeaver-bin
  ];
}
