# VMs with virt-manager + libvirtd + qemu + kvm
# based on https://nixos.wiki/wiki/Virt-manager
{ config, pkgs, ... }:

{
  programs.virt-manager.enable = true;

  virtualisation.libvirtd.enable = true;

  users.users.nils.extraGroups = [ "libvirtd" ];
}
