class Cxporter < Formula
  desc "Direct CLI access to Codex-authenticated MCP servers"
  homepage "https://github.com/mkusaka/cxporter"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mkusaka/cxporter/releases/download/v0.1.0/cxporter-0.1.0-darwin-arm64.tar.gz"
      sha256 "f63ac64ff03f6e2d1b7f9abe055600871dfd61786a1f17dce6ca9c0a3393df2f"
    else
      url "https://github.com/mkusaka/cxporter/releases/download/v0.1.0/cxporter-0.1.0-darwin-x64.tar.gz"
      sha256 "5f8a1785911f9293f3e9268dd9cfbb206662f68e3aa46fcb9609022b2db56267"
    end
  end

  def install
    bin.install "cxporter"
    (pkgshare/"skills").install Dir["skills/*"]
  end

  def caveats
    <<~EOS
      The bundled agent skill was installed to:
        #{opt_pkgshare}/skills

      Install it with npx skills:
        npx -y skills add "#{opt_pkgshare}/skills" -y --copy
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cxporter --version")
  end
end
