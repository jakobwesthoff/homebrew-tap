class Asqr < Formula
  desc "Answer questions an AI agent or a script prepared for you in the terminal"
  homepage "https://github.com/jakobwesthoff/asqr"
  url "https://github.com/jakobwesthoff/asqr/archive/refs/tags/v0.17.1.tar.gz"
  sha256 "3c043e7e7be663d7076588e06ca84b2e507be9d98a6bc8d063a75976ccdc395b"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/asqr.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/asqr-0.17.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "06651bf2f65470822e53a0637959f9c1677863ac9c0b4a9657dce5bb89b77897"
    sha256 cellar: :any,                 x86_64_linux: "3fd667767bf22f8fcaa1ff96c70e5b8863794d37803ed0f1e2df471adbabf1d0"
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
