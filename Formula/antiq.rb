class Antiq < Formula
  desc "Your idle folders, kept like antiques"
  homepage "https://antiq.westhoffswelt.de"
  url "https://github.com/jakobwesthoff/antiq/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "106a65b413f9f1a76258ba1ae9a20a91c9bdbc5ca2de8c77668a251ca58497bb"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/antiq.git", branch: "main"

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
