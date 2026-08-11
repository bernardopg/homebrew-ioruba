cask "ioruba" do
  arch arm: "aarch64", intel: "x64"

  version "1.7.1"
  sha256 arm:   "67be5d7e16f79e876a9951f8bd64747286ea978076144f5600dfce3159f2c2aa",
         intel: "e722e55af0679a169c7e3e7c742e2444526818ac97909aa58854233b4440bfcb"

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
