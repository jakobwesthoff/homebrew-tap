cask "torchsnap" do
  version "0.14.0"
  sha256 "e5625650f8ce62c0c8dbfcf08b639b8572ed9c27f8f4e9dfa3ce4538e3651526"

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
