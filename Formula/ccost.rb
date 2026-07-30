class Ccost < Formula
  desc "Claude Code, Codex, and OpenCode usage cost reporter"
  homepage "https://github.com/mkusaka/ccost"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/ccost/archive/refs/tags/v0.1.22.tar.gz"
  version "0.1.22"
  sha256 "9ca816e763cbd8bd3a585211c5429f21b43066757d295af34979de6858d156b7"
  license "MIT"
  head "https://github.com/mkusaka/ccost.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/ccost/releases/download/v0.1.22"
    sha256 arm64_tahoe:   "b1dad67e6d4b8ca51bd2edfa96ae3a291ab2d24bd4bcd22b6c5d01fef0047923"
    sha256 tahoe:         "34e98b0a0b452a21cf99b2978d20580f8be7349bb6bc7738d8da136248922f8e"
    sha256 arm64_sequoia: "d637144f511ef9f979bc7fdf1172edf5d08682adcf11f277800264ba429376c6"
    sha256 sequoia:       "086cccdf90343243b86e2c187dff62028985e0183e31914f1085c8dc31f63478"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Claude Code / Codex / OpenCode usage report", shell_output("#{bin}/ccost --help")
  end
end
