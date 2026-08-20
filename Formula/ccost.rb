class Ccost < Formula
  desc "Claude Code, Codex, and OpenCode usage cost reporter"
  homepage "https://github.com/mkusaka/ccost"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/ccost/archive/refs/tags/v0.1.24.tar.gz"
  version "0.1.24"
  sha256 "2135c8d05774264edfe74125938e542ee0ec16ead3c4cec06b69d787be806453"
  license "MIT"
  head "https://github.com/mkusaka/ccost.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/ccost/releases/download/v0.1.24"
    sha256 arm64_tahoe:   "130f16bb892d4a34bb709854e36225291b162a98798d3772075f459200cf00db"
    sha256 tahoe:         "383d3210e8fc46aef1db73d4f3a2f92950b531f32f609bd1be3a1fd1dfe0401d"
    sha256 arm64_sequoia: "2a490e01848102c87a12566f7686fb1c8b67478c870523db2d66ccd95ae8e9e9"
    sha256 sequoia:       "e12ee472375bb20f5b110a7b55f899b1a65c617397a06a1b6c313d6836a628f5"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Claude Code / Codex / OpenCode usage report", shell_output("#{bin}/ccost --help")
  end
end
