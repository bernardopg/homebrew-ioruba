cask "ioruba" do
  arch arm: "aarch64", intel: "x64"

  version "1.10.4"
  sha256 arm:   "3cad63e2d1e1ee50ff9bbc70f811de242bc4ccc45853e947f0e368efac54a393",
         intel: "4c6794c613c9192fdcad718a0f2b15c6defc7c1c5ce1df6870593e5c213433d3"

  url "https://github.com/bernardopg/ioruba/releases/download/v1.10.4/Ioruba_1.10.4_#{arch}.app.tar.gz",
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
