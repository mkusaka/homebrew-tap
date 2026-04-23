class Ccost < Formula
  desc "Claude Code, Codex, and OpenCode usage cost reporter"
  homepage "https://github.com/mkusaka/ccost"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/ccost/archive/refs/tags/v0.1.6.tar.gz"
  version "0.1.6"
  sha256 "bc1503c48bfe75c946d0e918f50a528205fbb97d2400dbac7e381f9c3b3f9f7d"
  license "MIT"
  head "https://github.com/mkusaka/ccost.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/ccost/releases/download/v0.1.6"
    sha256 arm64_tahoe: "e508b90ec4c533a401f154d134d179e04e10120ca7febec051a919b23b998279"
    sha256 tahoe: "073bb579b901cf400b86c7febdae7f1ebbe1bbf168f69a8809935511f3236040"
    sha256 arm64_sequoia: "77e4ac4b2bc616e7dff61f4fd79c7a985be891a8a2d713bd91308bea5d714407"
    sha256 sequoia: "5662143e1a2da8716085b486c8651397972092635ea0f744fb57b7cd681366cd"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Claude Code / Codex / OpenCode usage report", shell_output("#{bin}/ccost --help")
  end
end
