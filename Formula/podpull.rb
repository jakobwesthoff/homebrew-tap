class Podpull < Formula
  desc "Download and synchronize podcasts from RSS feeds"
  homepage "https://podpull.westhoffswelt.de"
  url "https://github.com/jakobwesthoff/podpull/archive/refs/tags/v2.0.3.tar.gz"
  sha256 "ed9758983653f7e7dcc17de1ce20781d674afc535fbccb55cd3e5ac6bb82e130"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/podpull.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/podpull-2.0.3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "0c0063a669bed254583597896886d4a187f552555009b6a9eb230a712d82aa1f"
    sha256 cellar: :any,                 x86_64_linux: "7cd4a11a57647898de3137c35746710724d08b6147c866e4427f5771741a852e"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/podpull --version")
    assert_match "Download and synchronize podcasts", shell_output("#{bin}/podpull --help")
  end
end
