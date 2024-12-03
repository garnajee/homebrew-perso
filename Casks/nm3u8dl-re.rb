cask "nm3u8dl-re" do
  version "0.2.1-beta"
  sha256 "ed314d1169e23f30faa1fab1bee28fb319a795219cbc7bab47367f406b85d6b3"

  url "https://github.com/nilaoda/N_m3u8DL-RE/releases/download/v0.2.1-beta/N_m3u8DL-RE_Beta_osx-arm64_20240828.tar.gz"
  name "N_m3u8DL-RE"
  homepage "https://github.com/nilaoda/N_m3u8DL-RE"

  artifact "N_m3u8DL-RE_Beta_osx-arm64/N_m3u8DL-RE", target: "/usr/local/bin/N_m3u8DL-RE"

  # No zap stanza required
end
