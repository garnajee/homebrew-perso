# Lists of brews in this repo

- [`shaka-packager`](https://github.com/shaka-project/shaka-packager): Casks: working ; Formula: build not working.
- [`N_m3u8DL-RE`](https://github.com/nilaoda/N_m3u8DL-RE): Cask: --- ; Formula: ---

## Shaka Packager
### Cask

![Update Shaka Packager Cask](https://github.com/garnajee/homebrew-shaka-packager/actions/workflows/update-cask.yml/badge.svg)
![Latest Shaka Packager Version](https://img.shields.io/github/v/release/shaka-project/shaka-packager)

shaka-packager macos installation with homebrew.

It will install the latest `packager-osx-arm64` binary.

To install:

`brew install --cask garnajee/perso/shaka-packager`

### Formula

`brew install --build-from-source garnajee/perso/shaka-packager`

**(not working on my side...)**

### Tests

To test installation:

```
packager --help
packager --version
```

***

## N\_m3u8DL-RE
### Cask

`brew install --cask garnajee/perso/nm3u8dl-re`

### Formula

`brew install garnajee/perso/nm3u8dl-re`

