class Ghok < Formula
  desc "Transparent GitHub CLI wrapper with pre/post hooks and operation normalization"
  homepage "https://github.com/mkusaka/ghok"
  version "0.0.27"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.27/ghok_darwin_arm64.tar.gz"
      sha256 "466cb02ed9d8daa1c8493b15eba4bb04ec3e69dc5c5cda0c52535c6d6e21fcf7"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.27/ghok_darwin_amd64.tar.gz"
      sha256 "574a8d7476bc5a84f5a385246ee77c069c506a25483303ef45bb028721590633"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.27/ghok_linux_arm64.tar.gz"
      sha256 "f865d3208af8008bd91f2a27c23b42d4fb1ad0e5e713ad5372cbedaa779ce0d0"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.27/ghok_linux_amd64.tar.gz"
      sha256 "60565a224686cefca50e7df9693fa7cef3680019b9b1a7b454f6ab942a2a07b0"
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
