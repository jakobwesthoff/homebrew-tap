class Antiq < Formula
  desc "Your idle folders, kept like antiques"
  homepage "https://antiq.westhoffswelt.de"
  url "https://github.com/jakobwesthoff/antiq/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "893e60d3e5b466efc782580b79774e97284533f4d7baef6fa464c28e3d386925"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/antiq.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/antiq-1.3.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "f4a91d27ba863856605ad4f89635c0c9e24af09eac7e32cfdd2807515f852a8f"
    sha256 cellar: :any,                 x86_64_linux: "9543d0f7c48905356e354d55a47548ab702dc74b1b158bc95cf6092b47c52eae"
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
