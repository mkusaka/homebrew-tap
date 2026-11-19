class Ghok < Formula
  desc "Transparent GitHub CLI wrapper with pre/post hooks and operation normalization"
  homepage "https://github.com/mkusaka/ghok"
  version "0.0.29"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.29/ghok_darwin_arm64.tar.gz"
      sha256 "d4147173125101cc8b2906dff02d2b5eb6f15e20e1abc6b893b323199b59211b"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.29/ghok_darwin_amd64.tar.gz"
      sha256 "06a129e828ac44be4a7e3b934b9ec59bf93cf1409958cc0ba4a6d79b8d1371ab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.29/ghok_linux_arm64.tar.gz"
      sha256 "915252e435ba65ecad5e8544157843642a1ee58224d4d2a6954bbc9fe2289eb1"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.29/ghok_linux_amd64.tar.gz"
      sha256 "aad383304a7812d88c864a4d455dec70e8b891764669e3e9afbfe51a1d446a81"
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
