class Gtok < Formula
  desc "Transparent Git wrapper with pre/post hooks and operation normalization"
  homepage "https://github.com/mkusaka/gtok"
  version "0.0.2"
  license "MIT"

  depends_on "git"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/gtok/releases/download/v0.0.2/gtok_0.0.2_darwin_arm64.tar.gz"
      sha256 "c5e97da378c39b88195345634fdb7df0cfd3e3c9fc191cf50b5eab2fe75c127c"
    else
      url "https://github.com/mkusaka/gtok/releases/download/v0.0.2/gtok_0.0.2_darwin_amd64.tar.gz"
      sha256 "40b5a34ddc22d3353486361e34f1c74a73f0412ebcf980dbc2cdb0e37fee9ed1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/gtok/releases/download/v0.0.2/gtok_0.0.2_linux_arm64.tar.gz"
      sha256 "bec10b577cbc4d51284e713349bd790762882bafd9c9cf3949a27650c57fbd09"
    else
      url "https://github.com/mkusaka/gtok/releases/download/v0.0.2/gtok_0.0.2_linux_amd64.tar.gz"
      sha256 "b4d315b3416c76a3dd3da66d98cb6e95165e128ec84c96878ba1dc9c14b62af2"
    end
  end

  def install
    bin.install "gtok"
  end

  def caveats
    <<~EOS
      gtok is installed but not active. Route `git` through it in one of two ways:
        gtok shim install                   # every git on this machine, incl. scripts and agents
        eval "$(gtok shell-init zsh)"        # only git typed in your shell (bash/fish also supported)
      The shim creates ~/.local/bin/git -> #{opt_bin}/gtok (shell rc files are not modified);
      put ~/.local/bin before #{HOMEBREW_PREFIX}/bin in PATH. Undo with `gtok shim uninstall`.
      Without a config git passes through untouched; create one with:
        gtok config init --scope user
      Then check everything with `gtok doctor`.
      Docs ship with the binary (offline): `gtok docs`, `gtok docs search "<query>"`, `gtok actions`.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gtok version")
  end
end
