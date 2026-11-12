class Antiq < Formula
  desc "Your idle folders, kept like antiques"
  homepage "https://antiq.westhoffswelt.de"
  url "https://github.com/jakobwesthoff/antiq/archive/refs/tags/v1.4.1.tar.gz"
  sha256 "4430846ec1a0d499d0b3a4d5cc01843f0b98f66184a0e137cd406153c520d71f"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/antiq.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/antiq-1.4.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "9217199b3832e5e31c03ff7c20074d4c8bbf2da978823d0458c8a854fa852a89"
    sha256 cellar: :any,                 x86_64_linux: "169463f1e07f9bc2b7e7d37666313a6eef9aa405021e5915ac28a0c25ae7d9c1"
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
