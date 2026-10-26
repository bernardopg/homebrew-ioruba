cask "ioruba" do
  arch arm: "aarch64", intel: "x64"

  version "1.10.1"
  sha256 arm:   "2396a3b094a19ba740020e677f40c185d914fe0c813a47e46796deef470efc7d",
         intel: "c9272eb6296a7a1e60ac13efca6874532266343f73883e658ba30bad3c71fcb0"

  url "https://github.com/bernardopg/ioruba/releases/download/v1.10.1/Ioruba_1.10.1_#{arch}.app.tar.gz",
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
