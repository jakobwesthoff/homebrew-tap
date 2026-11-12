class Podpull < Formula
  desc "Download and synchronize podcasts from RSS feeds"
  homepage "https://podpull.westhoffswelt.de"
  url "https://github.com/jakobwesthoff/podpull/archive/refs/tags/v2.0.3.tar.gz"
  sha256 "ed9758983653f7e7dcc17de1ce20781d674afc535fbccb55cd3e5ac6bb82e130"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/podpull.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/podpull-2.0.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "e6c11dce57787f5f816d74e29c24fefb6d94544692aea992c33c5e5957198992"
    sha256 cellar: :any,                 x86_64_linux: "26f610ff6d11510decab3450e7a7bf1ecd98e61a57c65a9d6914cae3f011d20c"
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
