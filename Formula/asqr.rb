class Asqr < Formula
  desc "Answer questions an AI agent or a script prepared for you in the terminal"
  homepage "https://github.com/jakobwesthoff/asqr"
  url "https://github.com/jakobwesthoff/asqr/archive/refs/tags/v0.17.2.tar.gz"
  sha256 "ed27a136e7e75b7a7d756b770bc4f368c1eacef36d2ac7793377ca8895880ede"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/asqr.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/asqr-0.17.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "be27c7029238d29d5ed68f472272ece9ac04e31380d113fc22ea239626de44da"
    sha256 cellar: :any,                 x86_64_linux: "8d20115c7940773996f4b56fbf0bff9436cb5f396a61c07bb135c3898a154ceb"
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
