class Nm3u8dlRe < Formula
  desc "Cross-Platform, modern and powerful stream downloader for MPD/M3U8/ISM"
  homepage "https://github.com/nilaoda/N_m3u8DL-RE"
  url "https://github.com/nilaoda/N_m3u8DL-RE/archive/refs/tags/.tar.gz"
  sha256 "172dbbf468f2d83896081a22c4d65964cd0fa3dfda7926bfbd6da8b7d4d91d75"
  version ""
  license "MIT"

  depends_on "dotnet" => :build

  def install
    arch = Hardware::CPU.intel? ? "x64" : "arm64"
    rid = "osx-#{arch}"

    system "dotnet", "publish", "src/N_m3u8DL-RE",
           "-r", rid,
           "-c", "Release",
           "-o", "artifact"

    bin.install "artifact/N_m3u8DL-RE" => "n_m3u8dl-re"
  end

  test do
    system "#{bin}/n_m3u8dl-re", "--version"
  end
end
