cask "ioruba" do
  arch arm: "aarch64", intel: "x64"

  version "1.8.4"
  sha256 arm:   "e3cb63338c391cf7e1a14462d0677d99f55098fc0fd467656c396264e8442ec5",
         intel: "50fb76d573e37a714021a0e8e6401e21cf5f7018f92663843a23d0c74e127261"

  url "https://github.com/bernardopg/ioruba/releases/download/v1.8.4/Ioruba_1.8.4_#{arch}.app.tar.gz",
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
