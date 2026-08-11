# Ioruba Homebrew tap

Install the [Ioruba](https://github.com/bernardopg/ioruba) macOS cask:

```sh
brew tap bernardopg/ioruba
brew install --cask ioruba
```

The cask is generated from the signed Ioruba GitHub release in the main repository. It selects the correct Intel or Apple Silicon bundle and verifies its SHA-256 digest.

> Current macOS bundles are not yet Apple-notarized. Homebrew will install them, but Gatekeeper behavior remains Apple-dependent until notarization is enabled.
