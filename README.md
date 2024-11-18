# Shaka Packager for Homebrew

## Cask

![Update Shaka Packager Cask](https://github.com/garnajee/homebrew-shaka-packager/actions/workflows/update-cask.yml/badge.svg)
![Latest Shaka Packager Version](https://img.shields.io/github/v/release/shaka-project/shaka-packager)

shaka-packager macos installation with homebrew.

It will install the latest `packager-osx-arm64` binary.

To install:

`brew install --cask Cask/s/shaka-packager.rb`

## Formula

`brew install --build-from-source Formula/s/shaka-packager.rb`

**(not working on my side...)**

## Tests

To test installation:

```
packager --help
packager --version
```

Official shaka-packager repository accessible [here](https://github.com/shaka-project/shaka-packager).
