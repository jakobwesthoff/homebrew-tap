class Antiq < Formula
  desc "Your idle folders, kept like antiques"
  homepage "https://antiq.westhoffswelt.de"
  url "https://github.com/jakobwesthoff/antiq/archive/refs/tags/v1.4.1.tar.gz"
  sha256 "4430846ec1a0d499d0b3a4d5cc01843f0b98f66184a0e137cd406153c520d71f"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/antiq.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/antiq-1.4.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "d77e67c650ee6e29bda0e699bafae8d79f6755ee8fda9e1e2e73e53debda89d8"
    sha256 cellar: :any,                 x86_64_linux: "a3c16823479111d5f01c70cbc50b16be09c42ee074210b789959a59ebdc5d46c"
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
