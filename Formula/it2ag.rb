class It2ag < Formula
  desc "iTerm2 agent monitor for Claude Code and Codex"
  homepage "https://github.com/mkusaka/it2ag"
  license "GPL-2.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/it2ag/releases/download/v0.0.1/it2ag-0.0.1-darwin-arm64.tar.gz"
      sha256 "c2ca0c0e91888d51924b9126086c066b250ba9ee9fd0b3f968a07677b00e21ee"
    else
      url "https://github.com/mkusaka/it2ag/releases/download/v0.0.1/it2ag-0.0.1-darwin-x64.tar.gz"
      sha256 "db588b0c69a23d7722beafda6551bf6f28f7db30cb2bfd8283aa484d2195c252"
    end
  end

  version "0.0.1"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"it2ag"
  end

  def caveats
    <<~EOS
      Requires iTerm2 with the Python API enabled:
        Settings > General > Magic > Enable Python API
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/it2ag --version")
  end
end
