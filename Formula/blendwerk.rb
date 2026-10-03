class Blendwerk < Formula
  desc "File-based HTTP and HTTPS API mock server"
  homepage "https://blendwerk.westhoffswelt.de"
  url "https://github.com/jakobwesthoff/blendwerk/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "7b3991d75f16e20feda34110c3155a35686b019404b318d73259260c631ba181"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/blendwerk.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/blendwerk-1.1.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "c8a3745f70ce8556f34d99fe371b322c5dbbfe03a32e66ae16445af6a8d8b032"
    sha256 cellar: :any,                 x86_64_linux: "6c2dd6c867811c28b330b0b3c5e8dc46ac5b57732a7c57076f9a8f5a4258041b"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/blendwerk --version")
  end
end
