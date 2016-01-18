# Easybuild on Nix

The config.nix should be enough to override your local packages.

symlink it into ~/.nixpkgs/config.Nix

```sh
$ cd $HOME
$ mkdir easybuild
$ nix-env -i fhsEasyBuild
$ fhsEasyBuild
```

will bind mount the easybuild directory into /easybuild in the jail and set up
an appropriate fhs root for you to build in
