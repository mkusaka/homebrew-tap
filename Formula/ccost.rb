class Ccost < Formula
  desc "Claude Code, Codex, and OpenCode usage cost reporter"
  homepage "https://github.com/mkusaka/ccost"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/ccost/archive/refs/tags/v0.1.7.tar.gz"
  version "0.1.7"
  sha256 "bbc5b2a34952872c9cdbf0c6da7ca510c1c41250bb87dafe91a27e8ffe895cd1"
  license "MIT"
  head "https://github.com/mkusaka/ccost.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/ccost/releases/download/v0.1.7"
    sha256 arm64_tahoe: "04bcc36a46dc9859fc9c1d7bb2fdf4c355ad5b522b62280cc9f1a00be14859cb"
    sha256 tahoe: "cd9790350a4029f6f7326a75f5c152eb1ba6dd78e18f86292a4c5f0f5b8b5769"
    sha256 arm64_sequoia: "715b14ec40f6c49a3278ee31760c4b8b2062d1380abc025f353e21433a394f9e"
    sha256 sequoia: "82db331c7fdd0910fae7b0923a36ea57291145c9adebf3bab8a66e719a5ff18b"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Claude Code / Codex / OpenCode usage report", shell_output("#{bin}/ccost --help")
  end
end
