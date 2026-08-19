class Cxtools < Formula
  desc "MCP server exposing OpenAI Codex tools by calling the codex-rs crates in-process"
  homepage "https://github.com/mkusaka/cxtools"
  url "https://github.com/mkusaka/cxtools/archive/refs/tags/v0.0.1.tar.gz"
  version "0.0.1"
  sha256 "eb809ec0ef97a9c90c0416910c39b556d399e4170bbbffcd801877a53547444f"
  license "MIT"
  head "https://github.com/mkusaka/cxtools.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/cxtools/releases/download/v0.0.1"
    sha256 arm64_tahoe:   "c9e8e39301715c43cc656459891bb3a2dc027dcf5bb7000c1211e308c4db23ce"
    sha256 tahoe:         "4f5ff2b75e3940c3d7beaede17f07efbc10b604129e77c61e995604354849168"
    sha256 arm64_sequoia: "7f18050b29a26e20955f75f39e339ed3f04814e3e2179e3cf743e78425fc9e93"
    sha256 sequoia:       "549a7867f855ff0272d23816f8efe155f94e6b68310d2d4d9781bac66171b747"
  end

  depends_on "rust" => :build

  def install
    # std_cargo_args already passes --locked; a fresh resolution would
    # drift the codex-rs workspace's rama-* crates away from the
    # versions its lockfile pins.
    system "cargo", "install", *std_cargo_args
  end

  test do
    # cxtools is a stdio MCP server: closing stdin without a completed
    # initialize handshake makes it exit 1, which is the expected outcome
    # for this smoke test (it confirms the binary runs and reads stdin).
    pipe_output("#{bin}/cxtools", "", 1)
  end
end
