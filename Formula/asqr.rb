class Asqr < Formula
  desc "Answer questions an AI agent or a script prepared for you in the terminal"
  homepage "https://github.com/jakobwesthoff/asqr"
  url "https://github.com/jakobwesthoff/asqr/archive/refs/tags/v0.15.0.tar.gz"
  sha256 "b69e2f626edaa795729a6b3c170b189a9cb261ea0337e068f8a7aadbdbbe2886"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/asqr.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/asqr-0.15.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "bde9003d4830ee59ac6873931e05ca17a06253f6416ca5eba09e8cdc6e7e9b3e"
    sha256 cellar: :any,                 x86_64_linux: "edcb6ee3c5e71bc41691e466d4624b3bf67cfff632d32622f1ac428ada38b414"
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
