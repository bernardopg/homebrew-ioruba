cask "ioruba" do
  arch arm: "aarch64", intel: "x64"

  version "1.9.6"
  sha256 arm:   "60dca38b420723ae18427d9934786f597b072b79e3c20070f2a33716ec21bce4",
         intel: "60a8e266b1c3dd7fd9d4552cb1513c84a0131cbd31ddded5c026210c8e91c668"

  url "https://github.com/bernardopg/ioruba/releases/download/v1.9.6/Ioruba_1.9.6_#{arch}.app.tar.gz",
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
