cask "ioruba" do
  arch arm: "aarch64", intel: "x64"

  version "1.9.4"
  sha256 arm:   "143202ee954495eabc14e7082751e713275b831fb27ebf2b3c8d6fefb1811aaf",
         intel: "3503bf4b3079ecbf5805137c20d5f688a41ae790c7d7d64dda0371f67ab6daf5"

  url "https://github.com/bernardopg/ioruba/releases/download/v1.9.4/Ioruba_1.9.4_#{arch}.app.tar.gz",
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
