class Gthok < Formula
  desc "Transparent Git wrapper with pre/post hooks and operation normalization"
  homepage "https://github.com/mkusaka/gthok"
  version "0.0.1"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/gthok/releases/download/v0.0.1/gthok_0.0.1_darwin_arm64.tar.gz"
      sha256 "2db9088380f794719ae11d9e9999e11497fa4e0d80eaea7ba3e2df4462111d5a"
    else
      url "https://github.com/mkusaka/gthok/releases/download/v0.0.1/gthok_0.0.1_darwin_amd64.tar.gz"
      sha256 "3864c0b2f4c2d1a8024ead49ecbef1824d19c638cf9656fa9d8fe2d39411165a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/gthok/releases/download/v0.0.1/gthok_0.0.1_linux_arm64.tar.gz"
      sha256 "a706f55236844d53b6fe8fcb63089f38ae8280604cef88fcd7cd339ae5c43b6b"
    else
      url "https://github.com/mkusaka/gthok/releases/download/v0.0.1/gthok_0.0.1_linux_amd64.tar.gz"
      sha256 "e6d57613b8a96eb7d89ed7588c5579069fc2000f53fa053d8bf00e515be4ec95"
    end
  end

  def install
    bin.install "gthok"
  end

  def caveats
    <<~EOS
      gthok is installed but not active. Route `git` through it in one of two ways:
        gthok shim install                   # every git on this machine, incl. scripts and agents
        eval "$(gthok shell-init zsh)"        # only git typed in your shell (bash/fish also supported)
      The shim creates ~/.local/bin/git -> #{opt_bin}/gthok (shell rc files are not modified);
      put ~/.local/bin before #{HOMEBREW_PREFIX}/bin in PATH. Undo with `gthok shim uninstall`.
      Without a config git passes through untouched; create one with:
        gthok config init --scope user
      Then check everything with `gthok doctor`.
      Docs ship with the binary (offline): `gthok docs`, `gthok docs search "<query>"`, `gthok actions`.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gthok version")
  end
end
