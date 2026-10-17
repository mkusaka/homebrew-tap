class Ghok < Formula
  desc "Transparent GitHub CLI wrapper with pre/post hooks and operation normalization"
  homepage "https://github.com/mkusaka/ghok"
  version "0.0.16"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.16/ghok_darwin_arm64.tar.gz"
      sha256 "7cea4a40b8f88f42de90d69da68aa7bc8d94db065c760c12d691004bfdd4f5d0"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.16/ghok_darwin_amd64.tar.gz"
      sha256 "5d5349a3be1080885f38233d648b1f15c6e3b5603cd2f3ef6b2fb8cefec57bfb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.16/ghok_linux_arm64.tar.gz"
      sha256 "436c703f6139cbdb2bdd216889a07c2a95d11ec3f3053440e531d4a8549954c6"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.16/ghok_linux_amd64.tar.gz"
      sha256 "8afbc123d6ed130c66f645afac5a84f91c9eb1db322d704db04fa56f1d9b6458"
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
