{ lib, pkgs, ... }:
{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "unityhub"
  ];

  environment.systemPackages = with pkgs; [
    unityhub
  ];
}
