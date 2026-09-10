cask "ioruba" do
  arch arm: "aarch64", intel: "x64"

  version "1.9.1"
  sha256 arm:   "1ce4c2441d56caca3fa3dda728dfce0be14261520e9397687b0712bd737e008d",
         intel: "1dff629473088038870c736eebc7078511e86d2b27c0f1a460dc749206959ae2"

  url "https://github.com/bernardopg/ioruba/releases/download/v1.9.1/Ioruba_1.9.1_#{arch}.app.tar.gz",
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
