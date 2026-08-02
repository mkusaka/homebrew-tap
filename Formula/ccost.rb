class Ccost < Formula
  desc "Claude Code, Codex, and OpenCode usage cost reporter"
  homepage "https://github.com/mkusaka/ccost"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/ccost/archive/refs/tags/v0.1.23.tar.gz"
  version "0.1.23"
  sha256 "8e347ed69bdf91c60a3a2062cdb671ddd7697b053d386624870932fffc35b389"
  license "MIT"
  head "https://github.com/mkusaka/ccost.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/ccost/releases/download/v0.1.23"
    sha256 arm64_tahoe:   "41b6d349a3955daa2d2496316a6233e31b1ce601c2318e5e6c3f4494bf4e1b68"
    sha256 tahoe:         "25e5e2b5e444db5b6e02222c99d257ab25d269316f9bda5a9df4be8b326e1417"
    sha256 arm64_sequoia: "372ae47217269e219970bcbeb0dd2e746744e653ae8e280dec2f77758ffc7255"
    sha256 sequoia:       "cd55146203ac09f7e46234f499d68a67230dd61d6603964d29b00ee492ec96ea"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Claude Code / Codex / OpenCode usage report", shell_output("#{bin}/ccost --help")
  end
end
