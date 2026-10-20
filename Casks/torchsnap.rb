cask "torchsnap" do
  version "0.15.0"
  sha256 "106f2b908ec62e121f4f748c5962ca1297b510e557af0d98d7ad353dc3cc279c"

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
