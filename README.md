# Personal Homebrew Packages

A collection of Homebrew formulae and casks for media streaming tools, maintained by [Garnajee](https://github.com/garnajee).

## Status & Availability

| Tool | Version | Type | Auto-Update Status | Description |
|:--- |:---:|:---:|:---:|:---|
| [**Shaka Packager**](https://github.com/shaka-project/shaka-packager) | ![Version](https://img.shields.io/github/v/release/shaka-project/shaka-packager?label=%20) | **Cask** | ![Cask Status](https://github.com/garnajee/homebrew-perso/actions/workflows/update-shaka-packager-cask.yml/badge.svg) | <br>Media packaging SDK for DASH/HLS. |
| | | **Formula** | ![Formula Status](https://github.com/garnajee/homebrew-perso/actions/workflows/update-shaka-packager-formula.yml/badge.svg) | |
| [**N_m3u8DL-RE**](https://github.com/nilaoda/N_m3u8DL-RE) | ![Version](https://img.shields.io/github/v/release/nilaoda/N_m3u8DL-RE?label=%20) | **Cask** | ![Cask Status](https://github.com/garnajee/homebrew-perso/actions/workflows/update-nm3u8dl-re-cask.yml/badge.svg) | <br>Cross-Platform stream downloader (DASH/HLS). |
| | | **Formula** | ![Formula Status](https://github.com/garnajee/homebrew-perso/actions/workflows/update-nm3u8dl-re-formula.yml/badge.svg) | |

---

## Installation

First, add this tap to your Homebrew:

```bash
brew tap garnajee/perso
```

### 1. Shaka Packager

You can install the pre-compiled binary (Cask) or the CLI tool (Formula).

*   **Option A: Cask (Recommended)**
    ```bash
    brew install --cask shaka-packager
    ```
*   **Option B: Formula**
    ```bash
    brew install shaka-packager
    ```

> **Verification:** Run `packager --version`

### 2. N_m3u8DL-RE

*   **Option A: Cask (Pre-compiled Binary)**
    ```bash
    brew install --cask nm3u8dl-re
    ```
*   **Option B: Formula (Build from source)**
    ```bash
    brew install nm3u8dl-re
    ```

> **Verification:** Run `n_m3u8dl-re --version`

---

## Maintenance

After updates, you can remove old versions and free up space:

```bash
brew cleanup --prune=all
```

## Contributing

Feel free to open an **[Issue](https://github.com/garnajee/homebrew-perso/issues)** or submit a **Pull Request** for improvements.

## Maintainer

Maintained by **[Garnajee](https://github.com/garnajee)**.

