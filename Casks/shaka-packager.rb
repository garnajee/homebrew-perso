cask "shaka-packager" do
  version "3.4.0"
  sha256 "97acc637f83a3967e576612c2a627346f3a271bc018949c8e28b076b9cc517fc"

  url "https://github.com/shaka-project/shaka-packager/releases/download/v#{version}/packager-osx-arm64"
  name "Shaka Packager"
  desc "Packager for DASH and HLS streaming"
  homepage "https://github.com/shaka-project/shaka-packager"

  livecheck do
    url "https://github.com/shaka-project/shaka-packager/releases"
    strategy :page_match
    regex(%r{href=.*?/v?(\d+(?:\.\d+)+)/packager-osx-arm64}i)
  end

  binary "packager-osx-arm64", target: "packager"

  caveats <<~EOS
    To use `packager`, run the following command in your terminal:
      packager --help
  EOS
end
