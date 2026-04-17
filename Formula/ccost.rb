class Ccost < Formula
  desc "Claude Code, Codex, and OpenCode usage cost reporter"
  homepage "https://github.com/mkusaka/ccost"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/ccost/archive/refs/tags/v0.1.5.tar.gz"
  version "0.1.5"
  sha256 "21c7fc72652fc9c8bca0738c5dd22490e2d42da369639aec75bb244e5c95382e"
  license "MIT"
  head "https://github.com/mkusaka/ccost.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/ccost/releases/download/v0.1.5"
    sha256 arm64_tahoe: "33e106cac05b7b10cf9166c1ea35abce856cd5784ffaeb8f1beb41d79e7d2879"
    sha256 tahoe: "4b1cc51a6490592510fce44f13f964d1839c383244611ab4bd88aaccd314fbcf"
    sha256 arm64_sequoia: "8898e65e0f8a9bdc59bc7965c3d36fc7feac4a7603bb603a4ecdf30cd267562d"
    sha256 sequoia: "2eaa462ad354ab30d86aaf7ea3e20b48bcacad769163fa3f33a65326e59e421c"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Claude Code / Codex / OpenCode usage report", shell_output("#{bin}/ccost --help")
  end
end
