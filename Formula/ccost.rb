class Ccost < Formula
  desc "Claude Code, Codex, and OpenCode usage cost reporter"
  homepage "https://github.com/mkusaka/ccost"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/ccost/archive/refs/tags/v0.1.27.tar.gz"
  version "0.1.27"
  sha256 "ebb5644b3ea9f69742d735de4fef0079bb50870c5eca34ed9b478b8c24006962"
  license "MIT"
  head "https://github.com/mkusaka/ccost.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/ccost/releases/download/v0.1.27"
    sha256 arm64_tahoe:   "c3cbc1719062335e931e65895d4dd3855d6456c85eb22813a78492bf194a1243"
    sha256 tahoe:         "945362413e5577e750c93fa09d8d6091b841226d6514f596abf5325e6d1516cd"
    sha256 arm64_sequoia: "ca200739b012b93be70b8486ea5f2464276a89067c1484f5f6fe84e1bd85ee94"
    sha256 sequoia:       "f44b13016c10bd42ad0815b19cc1a87425462702db9b4c9fd6a0bb7c04672616"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Claude Code / Codex / OpenCode usage report", shell_output("#{bin}/ccost --help")
  end
end
