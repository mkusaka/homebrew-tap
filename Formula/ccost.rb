class Ccost < Formula
  desc "Claude Code, Codex, and OpenCode usage cost reporter"
  homepage "https://github.com/mkusaka/ccost"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/ccost/archive/refs/tags/v0.1.33.tar.gz"
  version "0.1.33"
  sha256 "93bb794cba0de6a7a5627f28cbc0a3cf264f89adaff5eec0b0ffc822c696f5e9"
  license "MIT"
  head "https://github.com/mkusaka/ccost.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/ccost/releases/download/v0.1.33"
    sha256 arm64_tahoe:   "001bbbb19dcc59b9d80f68b13e6083bb73d1f0a6685c19a780b3b017ae963df8"
    sha256 tahoe:         "5f0b2389400817a583a1a9b7db38752041543e625217004cf0a8b9821a36d00b"
    sha256 arm64_sequoia: "55cde6fa0d8c1be629ba430e7fe093bdcace482e68a48724e06aa803281f8065"
    sha256 sequoia:       "833894445cfd059b36147231372d2ba1aa5566cb902c30b330eb08c7ce475251"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Claude Code / Codex / OpenCode usage report", shell_output("#{bin}/ccost --help")
  end
end
