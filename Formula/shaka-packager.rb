class ShakaPackager < Formula
  desc "SDK for media packaging of DASH/HLS content (includes packager, pssh-box.py, and mpd_generator)"
  homepage "https://github.com/shaka-project/shaka-packager"
  version "3.7.0"
  license "BSD-3-Clause"

  if Hardware::CPU.arm?
    url "https://github.com/shaka-project/shaka-packager/releases/download/v#{version}/packager-osx-arm64"
    sha256 "417f5b2b4035f88d1e2a77fecf721f995c0a9f4c90995255253fc6d2153b68ea"
  else
    url "https://github.com/shaka-project/shaka-packager/releases/download/v#{version}/packager-osx-x64"
    sha256 "5ae2547119af79c7916b25ed6fe3ee63ad2e7446b6182cace816781ce35e1fa1"
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
