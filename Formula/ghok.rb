class Ghok < Formula
  desc "Transparent GitHub CLI wrapper with pre/post hooks and operation normalization"
  homepage "https://github.com/mkusaka/ghok"
  version "0.0.22"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.22/ghok_darwin_arm64.tar.gz"
      sha256 "780742fb4c409c051f28fbe88b4c67f20e98e970a6f6fd4c858d8180f798a4b7"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.22/ghok_darwin_amd64.tar.gz"
      sha256 "dcea104c602ef71b2df63d55aeef1cfe0023add0a543c73ed33d5819ce050271"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.22/ghok_linux_arm64.tar.gz"
      sha256 "eff3832bb2c7c2dadb2b03ff97e7520013f1896f5a800c723c48705a47347029"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.22/ghok_linux_amd64.tar.gz"
      sha256 "4c6fbe031871b9c9642333c822a099e9a3891f58e85645f8c1968c3bb1a1f956"
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
