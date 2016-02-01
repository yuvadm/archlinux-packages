# Arch Linux Packages

A collection of all the Arch Linux packages I maintain, currently AUR packages only.

Should be identical to https://aur.archlinux.org/packages/?SeB=m&K=yuvadm

Feel free to open issues/PRs in this repository for fixes to be merged into the AUR.

## Usage

### New AUR Package

```bash
$ git remote add -f pkgname ssh://aur@aur.archlinux.org/pkgname.git
$ git merge -s ours --no-commit pkgname/master
$ git read-tree --prefix=pkgname/ -u pkgname/master
$ git commit -m "Add pkgname subtree"
```

### Synchronizing Existing Package Updates

```bash
$ git pull -s subtree pkgname master
```
