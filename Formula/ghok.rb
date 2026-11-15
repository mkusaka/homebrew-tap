class Ghok < Formula
  desc "Transparent GitHub CLI wrapper with pre/post hooks and operation normalization"
  homepage "https://github.com/mkusaka/ghok"
  version "0.0.26"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.26/ghok_darwin_arm64.tar.gz"
      sha256 "fc39b265e887e0799a138798f8c93d5413668d37809d8a5eec633f0356167380"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.26/ghok_darwin_amd64.tar.gz"
      sha256 "ae2d31c3e540fdde0e720da3ed7b41a7c194087fdf2b7c6064fd9872ef25694f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.26/ghok_linux_arm64.tar.gz"
      sha256 "4a1f3e2d88ac68a41b62756ee3746fed2cb75fcad89f81e5df0099c0ff65734e"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.26/ghok_linux_amd64.tar.gz"
      sha256 "8788bb018d280420a8e91d405d16a25c92d82e6252c4f1c658c9f00344a5e466"
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
