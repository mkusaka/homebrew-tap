class Ccost < Formula
  desc "Claude Code, Codex, and OpenCode usage cost reporter"
  homepage "https://github.com/mkusaka/ccost"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/ccost/archive/refs/tags/v0.1.13.tar.gz"
  version "0.1.13"
  sha256 "e53f2afb3ba62a77a477245f59168338d76202ed62f1b2321412754619cef2d8"
  license "MIT"
  head "https://github.com/mkusaka/ccost.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/ccost/releases/download/v0.1.13"
    sha256 arm64_tahoe:   "a4f151fdb20b527a669594b8a3f040127263c981381095973729651e0a0e48c2"
    sha256 tahoe:         "d8c0993dab0ce7bc2dede8c3a70ba834fddfc8e159cd267871a920de19dfa276"
    sha256 arm64_sequoia: "18acdaa369af4dcf0f557684d2090b558108e1e2ef8940a6744a4ccaa27de666"
    sha256 sequoia:       "961a730f92f4a1ef20b5467fd55ec4f58d8b283c1a333de08d3d65826d7bdc54"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Claude Code / Codex / OpenCode usage report", shell_output("#{bin}/ccost --help")
  end
end
