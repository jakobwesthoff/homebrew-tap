class Antiq < Formula
  desc "Your idle folders, kept like antiques"
  homepage "https://antiq.westhoffswelt.de"
  url "https://github.com/jakobwesthoff/antiq/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "239e19119f3992841e345dc29afbc94a05dc5375e597c81ad89e3b3b3cc42850"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/antiq.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/antiq-1.1.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "03e704bb69959b6b1ffa194879fb9520d0f85f97c125cdccd7aaaba8927d58a4"
    sha256 cellar: :any,                 x86_64_linux: "69cc4b0bacfdc490057db71ca29b61ec63def88f98c743277de6fa1bed2f54a5"
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
