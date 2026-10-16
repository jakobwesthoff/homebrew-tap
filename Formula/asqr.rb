class Asqr < Formula
  desc "Answer questions an AI agent or a script prepared for you in the terminal"
  homepage "https://github.com/jakobwesthoff/asqr"
  url "https://github.com/jakobwesthoff/asqr/archive/refs/tags/v0.12.1.tar.gz"
  sha256 "44d927e0126f63c7dd79c855c3fcfb0d17e79af1629e30500b72fb564bcada3f"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/asqr.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/asqr-0.12.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "3025f67c577a33c755bda2b9194aa112d7d897d3b5abe149670e4d402d35e4ea"
    sha256 cellar: :any,                 x86_64_linux: "256707a06e184a565e52b25cf307b23621a4f6e00e3fa8ca23112dc45a3e8c5b"
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
