class Ghok < Formula
  desc "Transparent GitHub CLI wrapper with pre/post hooks and operation normalization"
  homepage "https://github.com/mkusaka/ghok"
  version "0.0.23"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.23/ghok_darwin_arm64.tar.gz"
      sha256 "fffbb1a7770ba39c439b30d389fa21e4d8e72d67c3b123f59d1cbd824c566b8a"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.23/ghok_darwin_amd64.tar.gz"
      sha256 "c05b74a57e4782948873b666c2b8fe532f5d61e76960b7d0d46c5b42b1e90b59"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.23/ghok_linux_arm64.tar.gz"
      sha256 "47f3580a7e4a51a68eb3b7eed3a143a8264502c82d453ba30c1ecfd14cb6ce7d"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.23/ghok_linux_amd64.tar.gz"
      sha256 "677217a0911e04d94c2d7c6fbd9c668dd72840fba69e59b3b928a9a9198ee17a"
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
