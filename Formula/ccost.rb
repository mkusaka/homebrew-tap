class Ccost < Formula
  desc "Claude Code, Codex, and OpenCode usage cost reporter"
  homepage "https://github.com/mkusaka/ccost"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/ccost/archive/refs/tags/v0.1.10.tar.gz"
  version "0.1.10"
  sha256 "e4446f3c6f21013fa1375652db3bbc307a820441097e39fee3b20124161886d4"
  license "MIT"
  head "https://github.com/mkusaka/ccost.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/ccost/releases/download/v0.1.10"
    sha256 arm64_tahoe:   "1ba63d8e2c9b203c3aac6e5baba22d63cd6833227a09d7fa4d564460d2655852"
    sha256 tahoe:         "e39bb90090bc86f9af0d6d9918eccb710f981ebe1a1d0368a8474110423d2d81"
    sha256 arm64_sequoia: "f01cd79e0feedbe71970ff5406d62b327de1d187b26247789d457025d2ba5d68"
    sha256 sequoia:       "cd704f48775adcfa7db6065a675b1c70ed2c853c9485476c86f1fe8ec0059c2e"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Claude Code / Codex / OpenCode usage report", shell_output("#{bin}/ccost --help")
  end
end
