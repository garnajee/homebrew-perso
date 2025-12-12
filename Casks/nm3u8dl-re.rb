cask "nm3u8dl-re" do
  version "0.5.1-beta"
  sha256 arm:   "537866d7d03c9aed04c910014bceae26a3db494c1d1edae9c59ddaaa29b0a1c7",
        intel:  "fb0d9fd6c18b08a5c55e49f60d3c219471196bd05bf15e58f318a44da500f65a"
  arch arm: "arm64", intel: "x64"

  url "https://github.com/nilaoda/N_m3u8DL-RE/releases/download/v#{version}/N_m3u8DL-RE_v#{version}_osx-#{arch}_20251029.tar.gz"
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
