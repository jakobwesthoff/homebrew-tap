class Asqr < Formula
  desc "Answer questions an AI agent or a script prepared for you in the terminal"
  homepage "https://github.com/jakobwesthoff/asqr"
  url "https://github.com/jakobwesthoff/asqr/archive/refs/tags/v0.12.2.tar.gz"
  sha256 "c9c6349c54f64b84db1f0fbe6497e3e714fa39e4909509ebb3ba3b1d37d8c81b"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/asqr.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/asqr-0.12.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "1ee2a5f58975d172b56b77f9811f22292e6b738acb6cbf574b17b91d0c7215a8"
    sha256 cellar: :any,                 x86_64_linux: "4fd2a5de631c1fe9e1b32173ab4dfccb3ab0c71b92ab269b6ca00cccdaaad56d"
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
