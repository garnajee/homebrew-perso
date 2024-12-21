cask "shaka-packager" do
  version "3.4.1"
  sha256 arm:   "d1ae840b0c7b935c4524942b86c4728a2ceffa5cb441367b15f8ca8aef5b2565",
        intel:  "b911f9af54c1d70d56b8030708b5100d31f1d6210a09a41d7fa6680eac35706a"
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
