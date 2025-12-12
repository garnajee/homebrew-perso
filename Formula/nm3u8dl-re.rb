class Nm3u8dlRe < Formula
  desc "Cross-Platform, modern and powerful stream downloader for MPD/M3U8/ISM"
  homepage "https://github.com/nilaoda/N_m3u8DL-RE"
  url "https://github.com/nilaoda/N_m3u8DL-RE/archive/refs/tags/v0.5.1-beta.tar.gz"
  sha256 "a4532328b9d31d4511d73a7c6f05929824c6575972856f610f44358892f3de6c"
  license "MIT"

  depends_on "dotnet" => :build

  def install
    arch = Hardware::CPU.intel? ? "x64" : "arm64"
    rid = "osx-#{arch}"

    system "dotnet", "publish", "src/N_m3u8DL-RE", 
           "--configuration", "Release", 
           "--runtime", rid, 
           "--self-contained", "false",
           "--output", "artifact"

    bin.install "artifact/N_m3u8DL-RE" => "n_m3u8dl-re"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/n_m3u8dl-re --version")
  end
end
