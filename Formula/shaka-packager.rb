class ShakaPackager < Formula
  desc "SDK for media packaging of DASH/HLS content (includes packager, pssh-box.py, and mpd_generator)"
  homepage "https://github.com/shaka-project/shaka-packager"
  version "3.9.0"
  license "BSD-3-Clause"

  if Hardware::CPU.arm?
    url "https://github.com/shaka-project/shaka-packager/releases/download/v#{version}/packager-osx-arm64"
    sha256 "2da46e390c501051ef4f5f824ccbfe0882ce90c35d64ec9e4602b3481eea62b6"
  else
    url "https://github.com/shaka-project/shaka-packager/releases/download/v#{version}/packager-osx-x64"
    sha256 "0cec1fe9e1e7e5aee1fc5dfed3c526d4707525f0796fd1d79bd1d350ea3addbc"
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
