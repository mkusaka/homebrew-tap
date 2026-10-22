class Ghok < Formula
  desc "Transparent GitHub CLI wrapper with pre/post hooks and operation normalization"
  homepage "https://github.com/mkusaka/ghok"
  version "0.0.21"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.21/ghok_darwin_arm64.tar.gz"
      sha256 "fba685b39d20b03efc29f37457929e6459201caf67f4459e5e9c2eedbc3fdc6f"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.21/ghok_darwin_amd64.tar.gz"
      sha256 "c1775645c508dbbdee1b40a66a0850ad32fe9d92bc28badb5a872057425bcba0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.21/ghok_linux_arm64.tar.gz"
      sha256 "7df241492e0ea929fa7a169f3fac02332735fb4c598e61c275788f914c678f36"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.21/ghok_linux_amd64.tar.gz"
      sha256 "f99b4756ec39ec40be75cbbd71fb776c23a636f5fba277e02dd38866c0b3464c"
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
