cask "ioruba" do
  arch arm: "aarch64", intel: "x64"

  version "1.8.0"
  sha256 arm:   "69fb4788ea214ea44f98df99830e3ba662462cca30a1e0fdc5592ca89c62787b",
         intel: "b278c63610228f5891e715ec8fd40caaf1f2d1a57ea7e087694fb54f5720f073"

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
