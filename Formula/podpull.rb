class Podpull < Formula
  desc "Download and synchronize podcasts from RSS feeds"
  homepage "https://podpull.westhoffswelt.de"
  url "https://github.com/jakobwesthoff/podpull/archive/refs/tags/v2.1.1.tar.gz"
  sha256 "68853f7b58d9006a90735e84f1b8708989283b5ba81db863adb7042a950c1e24"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/podpull.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/podpull-2.1.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "2a4f69ea51b53e0c5400fdb83e68052cf85119373c7bb911788807007e13d750"
    sha256 cellar: :any,                 x86_64_linux: "feab3acb04a405374c3b55a38d56d56d0c0d800cb874c26c571e175252ba3c31"
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
