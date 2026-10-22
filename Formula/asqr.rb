class Asqr < Formula
  desc "Answer questions an AI agent or a script prepared for you in the terminal"
  homepage "https://github.com/jakobwesthoff/asqr"
  url "https://github.com/jakobwesthoff/asqr/archive/refs/tags/v0.13.0.tar.gz"
  sha256 "a113aadfa088725d1bfa05c1225a9030f17b66ee6e2846ea61fceb35f0adf995"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/asqr.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/asqr-0.13.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "35135ed0281c97d3bf327d54e624465c177e4c23847a7c127b6a3d9279c68a7d"
    sha256 cellar: :any,                 x86_64_linux: "71413baaf84bcbf392d27f2a7c0c5d5fa0427877f5f17c1ed7c2f1b9f429fc3a"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asqr --version")
    (testpath/"session.json").write shell_output("#{bin}/asqr new")
    assert_match "valid", shell_output("#{bin}/asqr validate #{testpath}/session.json")
  end
end
