class Ccost < Formula
  desc "Claude Code, Codex, and OpenCode usage cost reporter"
  homepage "https://github.com/mkusaka/ccost"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/ccost/archive/refs/tags/v0.1.3.tar.gz"
  version "0.1.3"
  sha256 "853a1820c1f91945a78193d5bd3db89f6e46e73fce8f22491e8e79f8e31fec3f"
  license "MIT"
  head "https://github.com/mkusaka/ccost.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/ccost/releases/download/v0.1.3"
    sha256 arm64_tahoe: "f32f9a33c6e4127e1ac38cf840ee9eb0b04a870a363c82502762da749fed2021"
    sha256 tahoe: "ef1632f3fae0a4a8fc089d523afc5c3b90119282fd6c4a785eaed61190f2b0fb"
    sha256 arm64_sequoia: "0342cba1eb9eab75290646dd05354730811102ebcbe1a3c72c017e254771148a"
    sha256 sequoia: "dca3508fd73c12ae601a115e5b5fdfcf994ef72f7c6b5ba9a7768592e70402ee"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Claude Code / Codex / OpenCode usage report", shell_output("#{bin}/ccost --help")
  end
end
