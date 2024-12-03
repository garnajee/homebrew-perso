cask "nm3u8dl-re" do
  version "0.3.0-beta"
  sha256 "eb3488e5af13b969bd3da777f4ff11e514788a966d4bf593df009a8923bdd1fd"

  url "https://github.com/nilaoda/N_m3u8DL-RE/releases/download/v0.3.0-beta/N_m3u8DL-RE_v0.3.0-beta_osx-arm64_20241203.tar.gz"
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
