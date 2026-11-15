class Ccost < Formula
  desc "Claude Code, Codex, and OpenCode usage cost reporter"
  homepage "https://github.com/mkusaka/ccost"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/ccost/archive/refs/tags/v0.1.41.tar.gz"
  version "0.1.41"
  sha256 "daca9bde0dec48b134be190a6f3acd9c824411fa3b80c3729589b29975b0a98b"
  license "MIT"
  head "https://github.com/mkusaka/ccost.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/ccost/releases/download/v0.1.41"
    sha256 arm64_tahoe:   "dc280dbc145fd75e8ad3570642e229057ab9360ab494cb627fb5bab6f934a18a"
    sha256 tahoe:         "5ff0fa7bb7a707fd5e974c62160a79b51f658a38c943a573a9f05be30b1e670b"
    sha256 arm64_sequoia: "7452c75b3e15083fb5057f1579b74f41d6ed18f647ca7909d4029b49d63ba7bd"
    sha256 sequoia:       "934e3c1a51f214cea8e5025a1be732615ad9fa978b15c12699185ef8c92a8414"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Claude Code / Codex / OpenCode usage report", shell_output("#{bin}/ccost --help")
  end
end
