cask "ioruba" do
  arch arm: "aarch64", intel: "x64"

  version "1.10.2"
  sha256 arm:   "d93e87f258aeb36bbe50c965e0fc58b3c1ff23e5931cf7344df3f805b337f12f",
         intel: "70020dcd7eeb2ec4acf67cd03e094c0328de56f2459f24e40d5daf108692290d"

  url "https://github.com/bernardopg/ioruba/releases/download/v1.10.2/Ioruba_1.10.2_#{arch}.app.tar.gz",
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
