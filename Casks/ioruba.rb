cask "ioruba" do
  arch arm: "aarch64", intel: "x64"

  version "1.9.2"
  sha256 arm:   "0631bffcef5d9b70ad63c1f9a485a41d8a47ec694e8a34d6f11906c30422caac",
         intel: "bd18111dcd50bda5340aa16e3c63edeada37e73c6518242afc536d76dc20ccb0"

  url "https://github.com/bernardopg/ioruba/releases/download/v1.9.2/Ioruba_1.9.2_#{arch}.app.tar.gz",
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
