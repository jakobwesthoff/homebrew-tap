class Antiq < Formula
  desc "Your idle folders, kept like antiques"
  homepage "https://antiq.westhoffswelt.de"
  url "https://github.com/jakobwesthoff/antiq/archive/refs/tags/v1.6.0.tar.gz"
  sha256 "de4e8a6edef01394ff4788ddec3509fb1df8fb5fe1f5b0fd0ad325810909c7eb"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/antiq.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/antiq-1.6.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "760f204e430ef7035419f81d5fd9d1ea71b7606c06d37b8d7f75a2e139c1049f"
    sha256 cellar: :any,                 x86_64_linux: "dd649fd79497796d010e27063ed536fc20236dc95a403131baef5eecae1759ad"
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
