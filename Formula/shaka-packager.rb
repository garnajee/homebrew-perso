class ShakaPackager < Formula
  desc "SDK for media packaging of DASH/HLS content (includes packager, pssh-box.py, and mpd_generator)"
  homepage "https://github.com/shaka-project/shaka-packager"
  version "null"
  license "BSD-3-Clause"

  if Hardware::CPU.arm?
    url "https://github.com/shaka-project/shaka-packager/releases/download/v#{version}/packager-osx-arm64"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  else
    url "https://github.com/shaka-project/shaka-packager/releases/download/v#{version}/packager-osx-x64"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  end

  def install
    if Hardware::CPU.arm?
      bin.install "packager-osx-arm64" => "packager"
    else
      bin.install "packager-osx-x64" => "packager"
    end
    chmod 0755, bin/"packager"
  end

  test do
    assert_match "packager version", shell_output("#{bin}/packager --version")
  end
end
