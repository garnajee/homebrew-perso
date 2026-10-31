class ShakaPackager < Formula
  desc "SDK for media packaging of DASH/HLS content (includes packager, pssh-box.py, and mpd_generator)"
  homepage "https://github.com/shaka-project/shaka-packager"
  version "3.9.3"
  license "BSD-3-Clause"

  if Hardware::CPU.arm?
    url "https://github.com/shaka-project/shaka-packager/releases/download/v#{version}/packager-osx-arm64"
    sha256 "b3049e743451aab5c2cd7b1316a4ce055682c41effe06a49e2e6c95a9243d351"
  else
    url "https://github.com/shaka-project/shaka-packager/releases/download/v#{version}/packager-osx-x64"
    sha256 "64f0fece6a5f80603d9f19b3adc70e626303feb63b459fd599132632b8e76420"
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
