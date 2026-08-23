cask "ioruba" do
  arch arm: "aarch64", intel: "x64"

  version "1.8.3"
  sha256 arm:   "2826226c4265e7e111f6ebf91b79ed1040279a0a52e01d0fa9c80bd597fab88d",
         intel: "4d17abfd8f1accb35866f996d4f2c994060573f31040fb837fe7bebfbabd1ef6"

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
