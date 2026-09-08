cask "ioruba" do
  arch arm: "aarch64", intel: "x64"

  version "1.9.0"
  sha256 arm:   "5f74f454e871643d7fce7dafdb0aeb212a5301523df556438b32015a8d80c54f",
         intel: "037b74bac0e2529f5f2cb1b0c87c06072f9afacb8cfe8bc3251b59b843637a89"

  url "https://github.com/bernardopg/ioruba/releases/download/v1.9.0/Ioruba_1.9.0_#{arch}.app.tar.gz",
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
