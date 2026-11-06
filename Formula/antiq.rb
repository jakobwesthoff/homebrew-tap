class Antiq < Formula
  desc "Your idle folders, kept like antiques"
  homepage "https://antiq.westhoffswelt.de"
  url "https://github.com/jakobwesthoff/antiq/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "eb44842d6a7e2512192788781ca72d5721c14963e8066c51749aa602178061d9"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/antiq.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/antiq-1.0.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "e8e417072a53606da2c73a89d11a49c2d3ae3fa2a4448a7b5824da5ebc4306ea"
    sha256 cellar: :any,                 x86_64_linux: "191959222cdc2cd793ef6765dc58f76cdc34bc782673754d34853916308b8701"
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
