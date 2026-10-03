class Podpull < Formula
  desc "Download and synchronize podcasts from RSS feeds"
  homepage "https://podpull.westhoffswelt.de"
  url "https://github.com/jakobwesthoff/podpull/archive/refs/tags/v1.1.2.tar.gz"
  sha256 "303e820179ba2ee87c64bd323702323bf441527c6fcefcfc3ff87762bd15f30f"
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
