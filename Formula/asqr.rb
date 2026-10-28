class Asqr < Formula
  desc "Answer questions an AI agent or a script prepared for you in the terminal"
  homepage "https://github.com/jakobwesthoff/asqr"
  url "https://github.com/jakobwesthoff/asqr/archive/refs/tags/v0.14.0.tar.gz"
  sha256 "55faae77098f2b1cf4561584ab845218aea4fe544a7d0c3e699088e67e9d8eb4"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/asqr.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/asqr-0.14.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "8d669e689176e75d8d16bf97dc6979b21d74d551ff0b21faa33c042d0817b76f"
    sha256 cellar: :any,                 x86_64_linux: "d066e652fb91ab562c36b2295a7cc8def8afca8a1b7a0e213a4ddafb649a529b"
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
