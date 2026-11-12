class Podpull < Formula
  desc "Download and synchronize podcasts from RSS feeds"
  homepage "https://podpull.westhoffswelt.de"
  url "https://github.com/jakobwesthoff/podpull/archive/refs/tags/v2.1.0.tar.gz"
  sha256 "ccd5eb0c08168f779dbb10733bf42c3960cc41a5cdde2a154092b98949b4a08c"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/podpull.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/podpull-2.1.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "64dbc66a2b78758e85b728d2e5ef8281e1f4c213b5b105455d0cebfd7407d2cc"
    sha256 cellar: :any,                 x86_64_linux: "fecf4459ec374bb61db36049ce8b9748eef210dc2f5861ec786f21c109e8000e"
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
