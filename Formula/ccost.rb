class Ccost < Formula
  desc "Claude Code, Codex, and OpenCode usage cost reporter"
  homepage "https://github.com/mkusaka/ccost"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/ccost/archive/refs/tags/v0.1.30.tar.gz"
  version "0.1.30"
  sha256 "6edcee11804a27b4a922d9efd482b78abf6234fcc5eec90e558a82891f481a2d"
  license "MIT"
  head "https://github.com/mkusaka/ccost.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/ccost/releases/download/v0.1.30"
    sha256 arm64_tahoe:   "e9448d82f32fb58f5a6d2c1dcec46f444d495f53a4e5a7704014c0325de03b35"
    sha256 tahoe:         "f327778e063ec3f38fac1f1f303770210043718c101760627bdac6eebb82be5a"
    sha256 arm64_sequoia: "d35a0fed6f9dc3a2f78a4101a9e93f54c0fefcaed5eead0656a448d3494ffcfb"
    sha256 sequoia:       "f559bd43b9d1cf82a878fedfcd636af7087fe48bb926f7db865e061e90ba9c6b"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Claude Code / Codex / OpenCode usage report", shell_output("#{bin}/ccost --help")
  end
end
