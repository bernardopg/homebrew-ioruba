cask "ioruba" do
  arch arm: "aarch64", intel: "x64"

  version "1.10.3"
  sha256 arm:   "1c3911e31b35a01aa48ce2b2bf041ef9b248b39bdb814b09f30aac7ea6009356",
         intel: "a3ecf22717c80319408221decd8ad7a105cce4279498ec71597ff0e5ec12aa94"

  url "https://github.com/bernardopg/ioruba/releases/download/v1.10.3/Ioruba_1.10.3_#{arch}.app.tar.gz",
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
