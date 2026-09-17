cask "ioruba" do
  arch arm: "aarch64", intel: "x64"

  version "1.9.3"
  sha256 arm:   "752162d62d7fe8ce215e644071be1d3ea1846cc4df0800fdbc10f46394b7846d",
         intel: "df073b2ade5e27eff9485bab171c91cb6d18b15a09b34d6a2fbeccf6b7254514"

  url "https://github.com/bernardopg/ioruba/releases/download/v1.9.3/Ioruba_1.9.3_#{arch}.app.tar.gz",
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
