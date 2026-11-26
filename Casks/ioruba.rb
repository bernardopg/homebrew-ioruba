cask "ioruba" do
  arch arm: "aarch64", intel: "x64"

  version "1.10.5"
  sha256 arm:   "10e3166d56b0719509abff88a030d25236554bfc38e33602fac52a33b34a563b",
         intel: "c7b33cfa6634b02a0a75e1d4ddfe7b03e0aadd2b934c430475ea1c8806277b8d"

  url "https://github.com/bernardopg/ioruba/releases/download/v1.10.5/Ioruba_1.10.5_#{arch}.app.tar.gz",
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
