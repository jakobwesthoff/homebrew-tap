class Asqr < Formula
  desc "Answer questions an AI agent or a script prepared for you in the terminal"
  homepage "https://github.com/jakobwesthoff/asqr"
  url "https://github.com/jakobwesthoff/asqr/archive/refs/tags/v0.17.0.tar.gz"
  sha256 "0c8c35bea5e5a10c51cbb270b0eb0c9c95f15dc8d261fab248b5619c7a0fe58a"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/asqr.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/asqr-0.16.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "afa3d903dc4ad48cf3830e03ac8cb5686e085bfce276b9904857207aa839621e"
    sha256 cellar: :any,                 x86_64_linux: "407e26bb4b40e8c1e29fd9c98630d8912084ec7cd5075a916f8591993ce2b60f"
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
