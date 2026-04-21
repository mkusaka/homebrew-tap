class It2ag < Formula
  desc "iTerm2 agent monitor for Claude Code and Codex"
  homepage "https://github.com/mkusaka/it2ag"
  license "GPL-2.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/it2ag/releases/download/v0.0.6/it2ag-0.0.6-darwin-arm64.tar.gz"
      sha256 "434aed7e81321abc01f1d6150e568e5f0411d932477e988fc92c875da1e4107a"
    else
      url "https://github.com/mkusaka/it2ag/releases/download/v0.0.6/it2ag-0.0.6-darwin-x64.tar.gz"
      sha256 "8202051db52c02636e3570d2bde66cb68409300a23344fdb5e8dcde2854f521a"
    end
  end

  version "0.0.6"

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
