class Ghok < Formula
  desc "Transparent GitHub CLI wrapper with pre/post hooks and operation normalization"
  homepage "https://github.com/mkusaka/ghok"
  version "0.0.15"
  license "MIT"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.15/ghok_darwin_arm64.tar.gz"
      sha256 "78365fb27eae93233c89d3b63f9114b3277bd30ff688ff1c26989ac5b7387f28"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.15/ghok_darwin_amd64.tar.gz"
      sha256 "5f1a365912ca680c05eaf079e7468e32bfae5b2d33fa57b3febee31120528b84"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.15/ghok_linux_arm64.tar.gz"
      sha256 "8570eba80f88be886eefd9654987c0bc6acea8bbaa6f76adb16d48363f515f8e"
    else
      url "https://github.com/mkusaka/ghok/releases/download/v0.0.15/ghok_linux_amd64.tar.gz"
      sha256 "1156ddf3a011cb1df2863ff3bcc7ccc9ded038812fce5d1298e2d955491538ef"
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
