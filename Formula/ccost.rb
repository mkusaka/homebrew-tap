class Ccost < Formula
  desc "Claude Code, Codex, and OpenCode usage cost reporter"
  homepage "https://github.com/mkusaka/ccost"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/ccost/archive/refs/tags/v0.1.4.tar.gz"
  version "0.1.4"
  sha256 "5006fdd818fbbd098da2b1409286f53b1093479a656490ea6ee0a473cf5534b7"
  license "MIT"
  head "https://github.com/mkusaka/ccost.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/ccost/releases/download/v0.1.4"
    sha256 arm64_tahoe: "f45f35bac8c895ef59c42333f00c21c3835dc6f83b5db2b3e9b5730d6886e61d"
    sha256 tahoe: "d29442072aee4af39814eea83556b4fcc0cce4a4a50f667cd902c6de7aeb2cc6"
    sha256 arm64_sequoia: "58e1382cd7bf2f91a607c4da4996d8020aa68c37c59231e0ad15ca8053093c4b"
    sha256 sequoia: "85554f923dd0503d9f6bcf765d7906ec21af58c2385a4f336e7f82135e7ee09f"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Claude Code / Codex / OpenCode usage report", shell_output("#{bin}/ccost --help")
  end
end
