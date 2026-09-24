class Ccost < Formula
  desc "Claude Code, Codex, and OpenCode usage cost reporter"
  homepage "https://github.com/mkusaka/ccost"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/ccost/archive/refs/tags/v0.1.31.tar.gz"
  version "0.1.31"
  sha256 "6e8f5fbb34f602bffdcdb89f9ff3a833392670bc812ee18141474a0a534a2339"
  license "MIT"
  head "https://github.com/mkusaka/ccost.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/ccost/releases/download/v0.1.31"
    sha256 arm64_tahoe:   "aadb6c82e49a2177a8b23b8ac4b13a399c84c80001cee3f9f7de74fea8b29e58"
    sha256 tahoe:         "838ce171223ec915133026c9e32b083225770062cb286125598d7424a91077be"
    sha256 arm64_sequoia: "9d8c9ff369b3895f18996d85e123f235eb172f6042608f862112317fbbf40683"
    sha256 sequoia:       "813f4a5793b6318b6edb89dff40d712b87e1e897740e30ed3363d77d911307fb"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Claude Code / Codex / OpenCode usage report", shell_output("#{bin}/ccost --help")
  end
end
