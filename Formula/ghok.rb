class Ghok < Formula
  desc "Transparent GitHub CLI wrapper with pre/post hooks and operation normalization"
  homepage "https://github.com/mkusaka/ghok"
  version "0.0.24"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.24/ghok_darwin_arm64.tar.gz"
      sha256 "a7a69c51e83667a1c9442fe54864e6c8629e2a6ba3d6c03f9cda77eddccf6765"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.24/ghok_darwin_amd64.tar.gz"
      sha256 "6df961572c9c0fbdfe6fc3ffeed9e46fe16233e658ac5b4712bf048ba3bc8289"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.24/ghok_linux_arm64.tar.gz"
      sha256 "a2e113e27e111e512ab246c51d65d2c0ebb6e94d53b54e20514c96b04367a279"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.24/ghok_linux_amd64.tar.gz"
      sha256 "4d366224fa9e033d956745d8863721a38ccdfa1028a1246d8644db9f088fbcff"
    end
  end

  def install
    bin.install "ghok"
  end

  def caveats
    <<~EOS
      ghok is installed but not active. Route `gh` through it in one of two ways:
        ghok shim install                   # every gh on this machine, incl. scripts and agents
        eval "$(ghok shell-init zsh)"       # only gh typed in your shell (bash/fish also supported)
      The shim creates ~/.local/bin/gh -> #{opt_bin}/ghok (shell rc files are not modified);
      put ~/.local/bin before #{HOMEBREW_PREFIX}/bin in PATH. Undo with `ghok shim uninstall`.
      Without a config gh passes through untouched; create one with:
        ghok config init --scope user
      Then check everything with `ghok doctor`.
      Docs ship with the binary (offline): `ghok docs`, `ghok docs search "<query>"`, `ghok actions`.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ghok version")
  end
end
