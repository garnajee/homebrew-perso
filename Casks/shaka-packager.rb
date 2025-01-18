cask "shaka-packager" do
  version "3.4.2"
  sha256 arm:   "d97cc27e2b003dd56937c54eb08f0c3f61637ad976a2d98b8bf2adaf041cb1c2",
        intel:  "cd70359fe9dadca88cce4a7ec32d93184d13f3439cf0f43fd95156dd8b8135df"
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
