class Antiq < Formula
  desc "Your idle folders, kept like antiques"
  homepage "https://antiq.westhoffswelt.de"
  url "https://github.com/jakobwesthoff/antiq/archive/refs/tags/v1.8.0.tar.gz"
  sha256 "c8cf66d96ea766b6589e0d521bca427b6bd503f9ae2bf40da94f4f2b40ea79f0"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/antiq.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/antiq-1.7.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "d307ea66ab20914f888cb8d66ed500268488655b0bf2ee9d3d8727567329aa41"
    sha256 cellar: :any,                 x86_64_linux: "987a68f25b632f0d0defc73d100ebe6d174660617682e560cf9b9141cc2adf60"
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
