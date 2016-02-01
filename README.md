# Arch Linux Packages

A collection of all the Arch Linux packages I maintain, currently AUR packages only.

Should be identical to https://aur.archlinux.org/packages/?SeB=m&K=yuvadm

Feel free to open issues/PRs in this repository for fixes to be merged into the AUR.

## Usage

The management of this repository is implemented using [git subtree](https://git.kernel.org/cgit/git/git.git/plain/contrib/subtree/git-subtree.txt) which allows all changes to be tracked in this single repo, as well as publish changes to each separate AUR package remote.

Use the `pkg.sh` wrapper script to run the common commands:

### Add New Package

```bash
$ ./pkg.sh add pkgname
```

### Update Package

Edit the relevant files in `aur/$pkgname` and then

```bash
$ git commit -m "Bumped $pkgname to v1.2.3"
$ ./pkg.sh update pkgname
```

### Import Packages

Many packages can be initially imported by running

```bash
$ ./pkg.sh import pkgname1 pkgname2 pkgname3
```
