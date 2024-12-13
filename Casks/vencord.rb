cask "vencord" do
  version "1.4.0"
  sha256 "b7b4d38643223df94f3af937ad05cd25c68d0b1aa5b6da52b71aee4593da8817"

  url "https://github.com/Vencord/Installer/releases/download/v#{version}/VencordInstaller.MacOS.zip"
  name "Vencord"
  desc "Vencord Installer for macOS"
  homepage "https://github.com/Vencord/Installer"

  container type: :zip

  app "VencordInstaller.app"

  zap trash: [
    "~/Library/Application Support/Vencord",
    "~/Library/Preferences/com.vencord.installer.plist",
    "~/Library/Caches/com.vencord.installer"
  ]
end
