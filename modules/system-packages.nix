{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    nh
  ];
}
