class Podpull < Formula
  desc "Download and synchronize podcasts from RSS feeds"
  homepage "https://podpull.westhoffswelt.de"
  url "https://github.com/jakobwesthoff/podpull/archive/refs/tags/v2.0.2.tar.gz"
  sha256 "667db6f38ff17ed8d998b8aa198fd0977b0045bff289f1ceec469d5ddbdb1682"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/podpull.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/podpull-1.1.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "04a1be4c97b709651e61440b9cb0a6c43720394ffb21351095089474be78808c"
    sha256 cellar: :any,                 x86_64_linux: "4c0ab7a75516f169137834aa44108afd59947c39aaae4c11060f41c63c3dea61"
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
