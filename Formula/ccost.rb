class Ccost < Formula
  desc "Claude Code, Codex, and OpenCode usage cost reporter"
  homepage "https://github.com/mkusaka/ccost"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/ccost/archive/refs/tags/v0.1.32.tar.gz"
  version "0.1.32"
  sha256 "6f7cb20f0f788bde45059fe2467d480ef8203f2133285df57ef94efdac2c2b75"
  license "MIT"
  head "https://github.com/mkusaka/ccost.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/ccost/releases/download/v0.1.32"
    sha256 arm64_tahoe:   "2843e8268068c66ffa4e570325649d1616259b8a6c6c201414614d20ca4509f2"
    sha256 tahoe:         "3dcc692a16986d0266de31de988956e418929b0c0594c2d4adc484fde625b5f2"
    sha256 arm64_sequoia: "408b6ff87130483b2996d63e2ef5ea7c44d2ed7ba22cb0a252ca6c2485ac97f3"
    sha256 sequoia:       "3e902d33c77f04cf23b9ce2edc94be74f023bdebec33fcb19d0eac7a6ae997b9"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Claude Code / Codex / OpenCode usage report", shell_output("#{bin}/ccost --help")
  end
end
