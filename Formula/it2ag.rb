class It2ag < Formula
  desc "iTerm2 agent monitor for Claude Code and Codex"
  homepage "https://github.com/mkusaka/it2ag"
  license "GPL-2.0-or-later"

on_macos do
  if Hardware::CPU.arm?
    url "https://github.com/mkusaka/it2ag/releases/download/v0.0.2/it2ag-0.0.2-darwin-arm64.tar.gz"
    sha256 "a518da3990a30088a8e43a08856bab266f9ca0770129b30e31d087353a557ac6"
  else
    url "https://github.com/mkusaka/it2ag/releases/download/v0.0.2/it2ag-0.0.2-darwin-x64.tar.gz"
    sha256 "a739a2032fa6d4b5414f425fe6890a193dae3da0bb6c8cb80aac4fbab5b5a37d"
  end
end

  version "0.0.2"

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
