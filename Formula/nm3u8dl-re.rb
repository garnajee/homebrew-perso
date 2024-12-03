class Nm3u8dlRe < Formula
  desc "Cross-Platform, modern and powerful stream downloader for MPD/M3U8/ISM."
  homepage "https://github.com/nilaoda/N_m3u8DL-RE"
  url "https://github.com/nilaoda/N_m3u8DL-RE/archive/refs/tags/v0.3.0-beta.tar.gz"
  sha256 "6cbad6b6fda2733099cabb3cc1f89884984bdfb644416f14713d9bcdd0e55676"

  depends_on "dotnet"

  def install
    system "dotnet", "--version"

    system "dotnet", "publish", "src/N_m3u8DL-RE", "-r", "osx-arm64", "-c", "Release", "-o", "artifact"

    bin.install "artifact/N_m3u8DL-RE"
  end

  test do
    system "#{bin}/N_m3u8DL-RE", "--version"
  end
end
