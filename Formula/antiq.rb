class Antiq < Formula
  desc "Your idle folders, kept like antiques"
  homepage "https://antiq.westhoffswelt.de"
  url "https://github.com/jakobwesthoff/antiq/archive/refs/tags/v1.7.0.tar.gz"
  sha256 "c7fe052d30a86b25064e7103c61e92f3cb6234cde181f7fc59ee9d7deeebbac1"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/antiq.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/antiq-1.7.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "b252225547a3078bca5ce140adc4710182bce57d97d2c6750849e4769740511c"
    sha256 cellar: :any,                 x86_64_linux: "7cef4b7f7702de21e1237731470dead932abc8796502c1f953b353b072dc611d"
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
