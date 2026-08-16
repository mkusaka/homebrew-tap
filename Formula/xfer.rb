class Xfer < Formula
  desc "Prepare a bounded session handoff for another coding agent"
  homepage "https://github.com/mkusaka/xfer"
  version "0.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/xfer/releases/download/v0.0.1/xfer-0.0.1-darwin-arm64.tar.gz"
      sha256 "2fd290570dbd0edde5404cffe4583560209dfb600ea01cb77937f6cef526a95f"
    else
      url "https://github.com/mkusaka/xfer/releases/download/v0.0.1/xfer-0.0.1-darwin-x64.tar.gz"
      sha256 "970687d265823941b34bc6de3ae9456b8db99533d593963ec7ff151e79bdf863"
    end
  end

  def install
    bin.install "xfer"
    (pkgshare/"skills").install Dir["skills/*"]
  end

  def caveats
    <<~EOS
      Agent skills were installed to:
        #{opt_pkgshare}/skills

      Install them with npx skills:
        npx -y skills add "#{opt_pkgshare}/skills" -y --copy

      Or install directly from the repository:
        npx -y skills add https://github.com/mkusaka/xfer -y
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/xfer --version")
  end
end
