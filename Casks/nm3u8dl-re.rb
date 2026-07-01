cask "nm3u8dl-re" do
  version "v0.6.0-beta"
  sha256 arm:   "ca181b7e8976564766c34e3cefe48fff409f58289ca970ade062668c01c53918",
        intel:  "4dab8d256ae3164557f48a3326c8fa60da99e37536ee1589ce6c841180fa8204"
  arch arm: "arm64", intel: "x64"

  url "https://github.com/nilaoda/N_m3u8DL-RE/releases/download/#{version}/N_m3u8DL-RE_#{version}_osx-#{arch}_20260629.tar.gz"
  name "N_m3u8DL-RE"
  desc "Cross-Platform, modern and powerful stream downloader for MPD/M3U8/ISM"
  homepage "https://github.com/nilaoda/N_m3u8DL-RE"

  binary "#{staged_path}/N_m3u8DL-RE", target: "N_m3u8DL-RE"

  # No zap stanza required

  caveats <<~EOS
    To use `N_m3u8DL-RE`, run the following command in your terminal:
      n_m3u8dl-re --help
  EOS
end
