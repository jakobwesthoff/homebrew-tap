class Asqr < Formula
  desc "Answer questions an AI agent or a script prepared for you in the terminal"
  homepage "https://github.com/jakobwesthoff/asqr"
  url "https://github.com/jakobwesthoff/asqr/archive/refs/tags/v0.18.0.tar.gz"
  sha256 "df5c6c183d24703938cf9ab4e71c8e649432a4d07edc2531f89e5a54b35c3735"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/asqr.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/asqr-0.17.3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "861f6db67efeb58ae1b5b0e09b75745491ef59efb1dca5b42b5f4e415831e2af"
    sha256 cellar: :any,                 x86_64_linux: "6af7bc61c09b9b25db04869f0986d0390491053fed17b1a5f49dff7c0e3c7f8d"
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
