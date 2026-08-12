cask "ioruba" do
  arch arm: "aarch64", intel: "x64"

  version "1.8.1"
  sha256 arm:   "c9fc955515176525d240c0957929e63a8765842efbe72f13c64433b8bec1b8ca",
         intel: "80253e0589e83ea1e10649643e213ecb3b931cd2afe23f450ffd6e85a434faa4"

  url "https://github.com/bernardopg/ioruba/releases/download/v#{version}/Ioruba_#{version}_#{arch}.app.tar.gz",
      verified: "github.com/bernardopg/ioruba/"
  name "Ioruba"
  desc "Tactile audio mixer for Arduino-based control surfaces"
  homepage "https://github.com/bernardopg/ioruba"

  depends_on macos: ">= :catalina"

  app "Ioruba.app"

  # The bundle is unsigned and unnotarized, so Gatekeeper would refuse to open
  # it. Drop this once the release is signed and notarized.
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
