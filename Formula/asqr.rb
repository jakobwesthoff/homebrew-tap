class Asqr < Formula
  desc "Answer questions an AI agent or a script prepared for you in the terminal"
  homepage "https://github.com/jakobwesthoff/asqr"
  url "https://github.com/jakobwesthoff/asqr/archive/refs/tags/v0.12.0.tar.gz"
  sha256 "30b305a9531209c90eac030a93f878ec4ba7c93a76d3f0866b055a8a1dd86f7d"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/asqr.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/asqr-0.12.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "59272ea2a8207f574b9e3c64d972229cadfc167c8a56f52fe9ae511dd566ddb7"
    sha256 cellar: :any,                 x86_64_linux: "7bf89b3d4d48728b7391dcefb9078d17a82e0d9424d2c6ee052c1bea92b65c87"
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
