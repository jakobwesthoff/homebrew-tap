class Mkulid < Formula
  desc "ULID generator, like uuidgen but for ULIDs"
  homepage "https://github.com/jakobwesthoff/mkulid"
  url "https://github.com/jakobwesthoff/mkulid/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "05bb916b040ea149867190638cadfa4296e1fefa8a7fba19b4dc7da4d5239c9e"
  license "MPL-2.0"
  head "https://github.com/jakobwesthoff/mkulid.git", branch: "main"

  bottle do
    root_url "https://github.com/jakobwesthoff/homebrew-tap/releases/download/mkulid-1.0.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "4be7540f72ea926c0dc4f3bd94068da772f07591d997e1b637c5b08b92e88e5c"
    sha256 cellar: :any,                 x86_64_linux: "1cd83010a763a02da1340c4a7182df679fb8bcdbae0929d4ae65604faf1faa50"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mkulid --version")
    # A ULID starts with its 48-bit millisecond timestamp, so the Unix epoch
    # gives ten zeros followed by 16 random Crockford base32 characters.
    assert_match(/\A0{10}[0-9A-HJKMNP-TV-Z]{16}\n\z/, shell_output("#{bin}/mkulid --timestamp 0"))
  end
end
