class NM3u8dlRe < Formula
  desc "Cross-Platform, modern and powerful stream downloader for MPD/M3U8/ISM."
  homepage "https://github.com/nilaoda/N_m3u8DL-RE"
  url "https://github.com/nilaoda/N_m3u8DL-RE/archive/refs/tags/v0.3.0-beta.tar.gz"
  sha256 "6cbad6b6fda2733099cabb3cc1f89884984bdfb644416f14713d9bcdd0e55676"
  license "MIT"

  depends_on "dotnet" => :build

  def install
    if Hardware::CPU.arm?
      rid = "osx-arm64"
    else
      rid = "osx-x64"
    end

    system "dotnet", "publish", "src/N_m3u8DL-RE", "-r", rid, "-c", "Release", "-o", "artifact"

    bin.install "artifact/N_m3u8DL-RE" => "n_m3u8dl-re"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/n_m3u8dl-re --help")
  end
end
