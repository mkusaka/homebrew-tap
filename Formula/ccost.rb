class Ccost < Formula
  desc "Claude Code, Codex, and OpenCode usage cost reporter"
  homepage "https://github.com/mkusaka/ccost"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/ccost/archive/refs/tags/v0.1.16.tar.gz"
  version "0.1.16"
  sha256 "58ebaa94ba1f2541242f34cd15035cf55bf7849c2ccf6dcb1bce48c7f68d744a"
  license "MIT"
  head "https://github.com/mkusaka/ccost.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/ccost/releases/download/v0.1.16"
    sha256 arm64_tahoe:   "b805e2b28a07b8873c3aadecc18d1867d681b141c67d1fa619352e0474a72c00"
    sha256 tahoe:         "7651f1ee7ce4d8008b9ceb9ab86642a0e9a47c83dae2d072754dfea8bebb5ee7"
    sha256 arm64_sequoia: "6e1a6e8ec004d24579b5bbc5b6f12b4793e2218841d96e06dc194d8372b394fc"
    sha256 sequoia:       "6b3fc3656acc5498fc0867dd53ba906e229d7dc1851c48e3f0b5a4e912e39cfc"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Claude Code / Codex / OpenCode usage report", shell_output("#{bin}/ccost --help")
  end
end
