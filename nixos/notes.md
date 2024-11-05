# general notes

## nix commands

sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz home-manager
sudo nix-channel --update

home-manager expire-generations

nix-collect-garbage --delete-older-than 2d

---

## program commands

warp-cli connect

---

## setting up rEFInd

sudo blkid
lsblk
sudo mount /dev/nvme0n1p1 /mnt

menuentry "NixOS" {
    icon \EFI\refind\icons\os_unknown.png
    volume [volume name]
    loader \EFI\systemd\systemd-bootx64.efi
    enabled
}

