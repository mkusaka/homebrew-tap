class Pbm < Formula
  desc "Deterministic macOS desktop automation CLI and MCP server"
  homepage "https://github.com/mkusaka/pbm"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/pbm/archive/refs/tags/v0.0.1.tar.gz"
  version "0.0.1"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"
  head "https://github.com/mkusaka/pbm.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/pbm/releases/download/v0.0.1"
    sha256 arm64_tahoe:   "0000000000000000000000000000000000000000000000000000000000000000"
    sha256 arm64_sequoia: "0000000000000000000000000000000000000000000000000000000000000000"
    sha256 tahoe:         "0000000000000000000000000000000000000000000000000000000000000000"
    sha256 sequoia:       "0000000000000000000000000000000000000000000000000000000000000000"
  end

  depends_on xcode: ["26.0", :build]
  depends_on macos: :sequoia

  def install
    system "swift", "build", "--configuration", "release", "--disable-sandbox"
    bin.install ".build/release/pbm"
    (pkgshare/"skills").install "skills/pbm-cli"
  end

  def caveats
    skill_path = opt_pkgshare/"skills"
    <<~EOS
      Optional agent skills were installed to:
        #{skill_path}

      Install from the packaged skill files with npx skills:
        npx -y skills add "#{skill_path}" --skill pbm-cli -y --copy

      Install from the repository with npx skills:
        npx -y skills add https://github.com/mkusaka/pbm --skill pbm-cli -y

      Add `--agent <host>` if you want to target a specific agent host.
    EOS
  end

  test do
    output = shell_output("#{bin}/pbm --version")
    assert_match "\"schemaVersion\":\"pbm.stable.v1\"", output
    assert_match "\"version\":\"#{version}\"", output
  end
end
