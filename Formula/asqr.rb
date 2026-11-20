class Asqr < Formula
  desc "Answer questions an AI agent or a script prepared for you in the terminal"
  homepage "https://github.com/jakobwesthoff/asqr"
  url "https://github.com/jakobwesthoff/asqr/archive/refs/tags/v0.19.0.tar.gz"
  sha256 "96f05f43da38f75ffdf9e354a1d4565b2247c00e56261242aff3296ecf1facf5"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/asqr.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/asqr-0.19.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "52e028629c5e9fd2d2c17c89a763274bd7cecb959cc728a3542b40d6b00b8e13"
    sha256 cellar: :any,                 x86_64_linux: "85c6f9d9711497e9901447f09ff90a9c6942a58d6e4bd209ca2c5a3cd6ef6637"
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
