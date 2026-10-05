cask "ioruba" do
  arch arm: "aarch64", intel: "x64"

  version "1.9.5"
  sha256 arm:   "82549d835fd0eb2d47977332bb51e2a5d67c23b3c73c02ac772c9777d7294014",
         intel: "a679e80c26504f692157b5f3f7743bd4a878d94dd818d4bf48867e1347a5c03f"

  url "https://github.com/bernardopg/ioruba/releases/download/v1.9.5/Ioruba_1.9.5_#{arch}.app.tar.gz",
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
