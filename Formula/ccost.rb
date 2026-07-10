class Ccost < Formula
  desc "Claude Code, Codex, and OpenCode usage cost reporter"
  homepage "https://github.com/mkusaka/ccost"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/ccost/archive/refs/tags/v0.1.17.tar.gz"
  version "0.1.17"
  sha256 "9d4f9c7d01e51aa184f9e421fdf2c69cca175d1e97b962166d31df1a2b1ef279"
  license "MIT"
  head "https://github.com/mkusaka/ccost.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/ccost/releases/download/v0.1.17"
    sha256 arm64_tahoe:   "a55555b58b7f4ab1e8dd3757989b81fbddb5f387728eee231b2cca6a155328d8"
    sha256 tahoe:         "ace58cafd398ef03ba85e83cc2f942f261b01f547d4909742062c59391747b3f"
    sha256 arm64_sequoia: "19e5fb21ed22157bfdbbb0b7f4947ffc20c1f92f0897c1cb18195f0d7a93b080"
    sha256 sequoia:       "23f0b501a5ea0550cef263a6e6a7318bd5b136db5e329c4c9c674e0132e2b49b"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Claude Code / Codex / OpenCode usage report", shell_output("#{bin}/ccost --help")
  end
end
