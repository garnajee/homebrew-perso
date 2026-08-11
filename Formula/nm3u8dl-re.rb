class Nm3u8dlRe < Formula
  desc "Cross-Platform, modern and powerful stream downloader for MPD/M3U8/ISM"
  homepage "https://github.com/nilaoda/N_m3u8DL-RE"
  url "https://github.com/nilaoda/N_m3u8DL-RE/archive/refs/tags/v0.6.0-beta.tar.gz"
  sha256 "7ecaf9614ac7d2897cb9c3d07c02e4ff6e4e19ce327cacbda916e6fb44b67d6d"
  license "MIT"

  depends_on "dotnet" => :build
  depends_on "brotli"
  depends_on "openssl@3"

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
