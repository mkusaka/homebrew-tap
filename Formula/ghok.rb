class Ghok < Formula
  desc "Transparent GitHub CLI wrapper with pre/post hooks and operation normalization"
  homepage "https://github.com/mkusaka/ghok"
  version "0.0.19"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.19/ghok_darwin_arm64.tar.gz"
      sha256 "1220fbca3f664baad47707bd0101b2386c348e9efba547baba696f0747c5923a"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.19/ghok_darwin_amd64.tar.gz"
      sha256 "768f129e6c67f0595e1e1187756dcd69667f0a0eeabd001205c101e54d0fc1e8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.19/ghok_linux_arm64.tar.gz"
      sha256 "85ac16d7e6b3a0c7c184b818336dc8dafc3df12f8dfe2689afef8446c30083d6"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.19/ghok_linux_amd64.tar.gz"
      sha256 "9f1bbc27d2a2eb812e541e09c68f7fd61b1dd6836548610c99e4143a816dc489"
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
