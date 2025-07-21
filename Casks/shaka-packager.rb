cask "shaka-packager" do
  version "null"
  sha256 arm:   "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5",
        intel:  "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  arch arm: "arm64", intel: "x64"

  url "https://github.com/shaka-project/shaka-packager/releases/download/v#{version}/packager-osx-#{arch}"
  name "Shaka Packager"
  desc "Packager for DASH and HLS streaming"
  homepage "https://github.com/shaka-project/shaka-packager"

  livecheck do
    url :url
    strategy :page_match
    regex(%r{href=.*?/v?(\d+(?:\.\d+)+)/packager-osx-(?:arm64|x64)}i)
  end

  binary "packager-osx-#{arch}", target: "packager"

  # No zap stanza required

  caveats <<~EOS
    To use `packager`, run the following command in your terminal:
      packager --help
  EOS
end
