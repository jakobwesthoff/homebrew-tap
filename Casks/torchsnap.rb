cask "torchsnap" do
  version "0.14.1"
  sha256 "7e420a9a2c8b947a4bd32d3ff41f7945513899a81b8791c0b79a4c74ad51c067"

  url "https://github.com/jakobwesthoff/torchsnap/releases/download/v#{version}/Torchsnap.dmg"
  name "Torchsnap"
  desc "Keyboard-driven launcher with sandboxed WebAssembly gadgets"
  homepage "https://torchsnap.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Torchsnap updates itself from its own feed; `brew upgrade` only
  # replaces it with `--greedy`.
  auto_updates true
  depends_on arch: :arm64
  depends_on :macos

  app "Torchsnap.app"

  uninstall quit: "app.torchsnap"

  # The autostart LaunchAgent is only removed by `zap`: an `uninstall
  # launchctl:` also runs on `brew upgrade` and `brew reinstall` and would
  # switch autostart off.
  zap trash: [
    "~/Library/Application Support/app.torchsnap",
    "~/Library/Caches/app.torchsnap",
    "~/Library/LaunchAgents/Torchsnap.plist",
    "~/Library/Preferences/app.torchsnap.plist",
    "~/Library/WebKit/app.torchsnap",
  ]
end
