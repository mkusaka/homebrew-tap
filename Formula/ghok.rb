class Ghok < Formula
  desc "Transparent GitHub CLI wrapper with pre/post hooks and operation normalization"
  homepage "https://github.com/mkusaka/ghok"
  version "0.0.25"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.25/ghok_darwin_arm64.tar.gz"
      sha256 "a5fcb526a4b9d8ae898fd4310d7651cc7468195784e72a46fda8db0aadef9373"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.25/ghok_darwin_amd64.tar.gz"
      sha256 "53350736de396579627f7601bc049370df4a540bd566ffb7527f9bac79579f33"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.25/ghok_linux_arm64.tar.gz"
      sha256 "842a211366cbbc4f03ab40f370ac8c6c28c945e4993cfee590d7b05dd17370aa"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.25/ghok_linux_amd64.tar.gz"
      sha256 "0071feb49a809cc07236d5f49dbf5819537b7ff88b327f078917b847c9e69d0b"
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
