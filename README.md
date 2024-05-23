# System [WIP]
Overarching repository for organising, documenting, and maintaining pretty much everything I do.

The aim of this repository is to make keeping track of *what* I've done to my system, and *why* I did that simple. To accomplish this, I'm trying to split up the complexity of my system into several distinct components.

## [Core](./core)
Core system functionality. Pretty much everything that happens between pressing the power button and logging in, basically everything listed in the [Arch boot process](https://wiki.archlinux.org/title/Arch_boot_process), including:
    - [Installation](./core/installation)
    - [UEFI](./core/uefi)
    - [Boot Loader](./core/bootloader)
    - [Kernel](./core/kernel)
    - [initramfs](./core/initramfs)
    - [Early Userspace](./core/early_userspace)
    - [Getty](./core/getty)
    - [Login](./core/login) 

## [Environment Variables](./env)
How, where, and why all the different environment variables on my system get set.

## [Shell](./shell)
Setup and configuration of my [Login Shell](./shell/login) and my [Interactive Shell](./shell/interactive)

## [Display Manager](./display)
Setup and configuration of [Wayland](./display/wayland) and [Sway](./display/sway)

# Setting up ''symlinks''
As this repository aims to collate and document many things, I make heavy use of submodules wherever possible. Unfortunately this isn't always available, at least not without having hundreds of mini-repos cluttering my profile. For files and directories that don't already have their own repository, I needed to find a way to include them in this repository that was:
- Simple, requiring little to no effort on my part
- Modular, allowing me to easily add, move, rename, and remove these files as needed
- Synchronised, keeping this repo up to date with local changes automatically

To me, this sounded like a symlink, however git doesn't "follow" symlinks easily. After doing some searching I saw that one possibility was to bind mount the directories I wanted to a mount point in the repository. However this requires root access, and isn't permenant (unless I populated my `/etc/fstab` with dozens of these mounts. The solution I came up with was to start an ssh server on my laptop, and use sshfs to mount a *local* directory to a *local* mountpoint via `sshfs localhost:/path/to/local/directory /path/to/local/mountpoint`. Finally, I created a [script](./set) which lists every directory -> mountpoint I want in a bash associative array, and provides function to mount, unmount, or toggle each of these pairs.
Because this is just a bash script, it would be trivial to run it on startup to automatically mount everything I want, however for the moment, I'm leaving it as manual so I can make sure nothing untoward happens.
