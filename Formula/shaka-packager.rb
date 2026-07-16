class ShakaPackager < Formula
  desc "SDK for media packaging of DASH/HLS content (includes packager, pssh-box.py, and mpd_generator)"
  homepage "https://github.com/shaka-project/shaka-packager"
  version "3.9.1"
  license "BSD-3-Clause"

  if Hardware::CPU.arm?
    url "https://github.com/shaka-project/shaka-packager/releases/download/v#{version}/packager-osx-arm64"
    sha256 "9d24b53c0324ec23ffb4b6d467533851a248f6d504b8ef6c19fe1139db664570"
  else
    url "https://github.com/shaka-project/shaka-packager/releases/download/v#{version}/packager-osx-x64"
    sha256 "be5f448b915b8a1e4631c157ecc04563791e2f252d0e6cc1f45211fdef5040b3"
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
