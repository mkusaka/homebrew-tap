class It2ag < Formula
  desc "iTerm2 agent monitor for Claude Code and Codex"
  homepage "https://github.com/mkusaka/it2ag"
  license "GPL-2.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/it2ag/releases/download/v0.0.4/it2ag-0.0.4-darwin-arm64.tar.gz"
      sha256 "8c8c0cf0dfdb89909540a23aea4f3a2d4ab6557cf0e8acec56e64dabf7cf756c"
    else
      url "https://github.com/mkusaka/it2ag/releases/download/v0.0.4/it2ag-0.0.4-darwin-x64.tar.gz"
      sha256 "bf236453beec4f48d72475f880e7c1e07ab380abf3a8585d75796627df360cfa"
    end
  end

  version "0.0.4"

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
