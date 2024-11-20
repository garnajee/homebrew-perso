class Nm3u8dlRe < Formula
  desc "Cross-Platform, modern and powerful stream downloader for MPD/M3U8/ISM."
  homepage "https://github.com/nilaoda/N_m3u8DL-RE"
  url "https://github.com/nilaoda/N_m3u8DL-RE/archive/refs/tags/v0.2.1-beta.tar.gz"
  sha256 "ed314d1169e23f30faa1fab1bee28fb319a795219cbc7bab47367f406b85d6b3"

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
