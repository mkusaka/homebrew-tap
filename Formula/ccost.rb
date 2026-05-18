class Ccost < Formula
  desc "Claude Code, Codex, and OpenCode usage cost reporter"
  homepage "https://github.com/mkusaka/ccost"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/ccost/archive/refs/tags/v0.1.11.tar.gz"
  version "0.1.11"
  sha256 "c6b7eec685a9fa361c973192238ad63418ab00f23f1f805464c04dc33f80bf78"
  license "MIT"
  head "https://github.com/mkusaka/ccost.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/ccost/releases/download/v0.1.11"
    sha256 arm64_tahoe:   "d24415d5b8a97a391f044e4b6fc0ae9dfbdd2d4f0f5e7e900894ebdab5182b1e"
    sha256 tahoe:         "2a783cc2bc57a1049fad173fecfd64798552c6941cb6671987a7db6b3403fc1c"
    sha256 arm64_sequoia: "e4c7c01e188cd084b2281eb3d63c4c8fa45a6dd16f324c786664e11ce551464a"
    sha256 sequoia:       "9ffc847e482d0489c23d11f7aad8704ad675f608a1d0f851057b8675f0f106bd"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Claude Code / Codex / OpenCode usage report", shell_output("#{bin}/ccost --help")
  end
end
