class Ghok < Formula
  desc "Transparent GitHub CLI wrapper with pre/post hooks and operation normalization"
  homepage "https://github.com/mkusaka/ghok"
  version "0.0.17"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.17/ghok_darwin_arm64.tar.gz"
      sha256 "03e4550e0cc179e8e0f7c677a0e601c3d1a982f770497698f9f9d3624c415f48"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.17/ghok_darwin_amd64.tar.gz"
      sha256 "c2f5bd5103f1fa863acf9abd9b915b6b3c96d961f27651e42f7db0cf260d2d18"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.17/ghok_linux_arm64.tar.gz"
      sha256 "cdbbfb61a2509f32636109bfcae04560f0e526219621f9bc79afcca6c5db32d9"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.17/ghok_linux_amd64.tar.gz"
      sha256 "18c3c2fc779d7b1837ee97597401d63c23f7db1d1b4ac77785a8d53b5f9905f9"
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
