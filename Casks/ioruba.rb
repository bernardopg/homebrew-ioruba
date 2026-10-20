cask "ioruba" do
  arch arm: "aarch64", intel: "x64"

  version "1.10.0"
  sha256 arm:   "1910c40c53f594fca248b7deb69189175b028bbc19f2678cf9278d28b6a078d4",
         intel: "e87635c7aa8ff0872b50429e2cb73672a3708e49a6d8b197b34f36538085ec66"

  url "https://github.com/bernardopg/ioruba/releases/download/v1.10.0/Ioruba_1.10.0_#{arch}.app.tar.gz",
      verified: "github.com/bernardopg/ioruba/"
  name "Ioruba"
  desc "Tactile audio mixer for Arduino-based control surfaces"
  homepage "https://github.com/bernardopg/ioruba"

  depends_on macos: ">= :catalina"

  app "Ioruba.app"

  # The bundle is unsigned and unnotarized by project policy, so Gatekeeper
  # would refuse to open it.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Ioruba.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/io.ioruba.desktop",
    "~/Library/Preferences/io.ioruba.desktop.plist",
    "~/Library/Saved Application State/io.ioruba.desktop.savedState",
  ]
end
