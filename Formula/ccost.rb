class Ccost < Formula
  desc "Claude Code, Codex, and OpenCode usage cost reporter"
  homepage "https://github.com/mkusaka/ccost"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/ccost/archive/refs/tags/v0.1.14.tar.gz"
  version "0.1.14"
  sha256 "7ae019ccf0c9a7ca1c368be65bc559571b13df46b2fc40210fbca8bba4b45436"
  license "MIT"
  head "https://github.com/mkusaka/ccost.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/ccost/releases/download/v0.1.14"
    sha256 arm64_tahoe:   "fd394f7d6effbdd430816cda62fc8329be7ae64082f1be749a9839fbb350d0a9"
    sha256 tahoe:         "0c6b81f27a2543c6704b9c72f9835361a1ced03e5d9d6a28b8308d4180e78b00"
    sha256 arm64_sequoia: "1a7320358cbf0c9552b3d32a16503cd3ccea3714533207ea5f2435c7bb5115bf"
    sha256 sequoia:       "cbac2e596f6596a6d1f72db4adadd75224dbf795b055d39549aa4302f97cc88c"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Claude Code / Codex / OpenCode usage report", shell_output("#{bin}/ccost --help")
  end
end
