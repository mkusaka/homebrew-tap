class Cxtools < Formula
  desc "MCP server exposing OpenAI Codex tools by calling the codex-rs crates in-process"
  homepage "https://github.com/mkusaka/cxtools"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/cxtools/archive/refs/tags/v#{version}.tar.gz"
  version "0.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"
  head "https://github.com/mkusaka/cxtools.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/cxtools/releases/download/v0.0.0"
    sha256 arm64_tahoe:   "0000000000000000000000000000000000000000000000000000000000000000"
    sha256 tahoe:         "0000000000000000000000000000000000000000000000000000000000000000"
    sha256 arm64_sequoia: "0000000000000000000000000000000000000000000000000000000000000000"
    sha256 sequoia:       "0000000000000000000000000000000000000000000000000000000000000000"
  end

  depends_on "rust" => :build

  def install
    # --locked is required: a fresh resolution drifts the codex-rs
    # workspace's rama-* crates away from the versions its lockfile pins.
    system "cargo", "install", "--locked", *std_cargo_args
  end

  test do
    pipe_output("#{bin}/cxtools", "", 0)
  end
end
