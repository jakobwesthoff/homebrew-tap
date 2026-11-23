class Antiq < Formula
  desc "Your idle folders, kept like antiques"
  homepage "https://antiq.westhoffswelt.de"
  url "https://github.com/jakobwesthoff/antiq/archive/refs/tags/v1.9.0.tar.gz"
  sha256 "a8fd121433381a32eb71dc130a9412bfbb81175908814e1581104edeed7df985"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/antiq.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/antiq-1.9.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "a7d786393155e4d937b6e78bb0a8bf51cd97fc183a0d1feb303fca5e1f80f2bd"
    sha256 cellar: :any,                 x86_64_linux: "86734f72a88faac968b3d85986e1f7400a259360ce1b9c117456f0ee1e6e74b7"
  end

  depends_on "rust" => :build
  # `antiq push` needs rsync 3.2.4 or newer and passes over the openrsync
  # that macOS ships.
  depends_on "rsync"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/antiq --version")
    assert_match "Your idle folders", shell_output("#{bin}/antiq --help")
  end
end
