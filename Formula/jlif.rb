class Jlif < Formula
  desc "Format and filter multi-object JSON logs from streaming input"
  homepage "https://jlif.westhoffswelt.de"
  url "https://github.com/jakobwesthoff/jlif/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "6769d23bd9193c0d28bebc086f19a43dc7d1d6f37fdb364004e7bdc2c03b2dd9"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/jlif.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/jlif-1.1.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "04f182db89c8d96f8f566bf72fce9d8196b1be5023bf9a9efab05f44cc006ec8"
    sha256 cellar: :any,                 x86_64_linux: "4a48ca637f67f4d171bd5830556c0f90b894d2ff64db18e4cb05e88b5df51ac4"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jlif --version")
    assert_match '{"a":1}', pipe_output("#{bin}/jlif --compact --no-color", "{ \"a\": 1 }\n")
  end
end
