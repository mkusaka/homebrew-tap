class Tk < Formula
  desc "Standalone Rust CLI for persistent structured task lists"
  homepage "https://github.com/mkusaka/tk"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/tk/archive/refs/tags/v0.0.2.tar.gz"
  version "0.0.2"
  sha256 "57698d89f1867b397b08c00d351ca002d7502d7e6fc51e978a866ce973b42fd3"
  license "MIT"
  head "https://github.com/mkusaka/tk.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/tk/releases/download/v0.0.2"
    sha256 arm64_tahoe: "42d26ae5ba84f619c09ff05ea43768fc7fd49a23d29a6754706511421a1f57eb"
    sha256 tahoe: "749b95191b9b4bdb58481eee38d0a12c1bef26b318a5cd9f7013e661f8395c0d"
    sha256 arm64_sequoia: "645bc9979a15dafd31e7ac768a39899b8f3de247ba0e44cb4aa3311727ea6732"
    sha256 sequoia: "7cdbaf61fd0b700c56cf6068a6fb28a4822c74026a04a2bb7653ba79dfbda95d"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    (pkgshare/"skills").install buildpath/"skills/tk-task-list"
    (pkgshare/"skills").install buildpath/".agents/skills/tk-release"
  end

  def caveats
    skill_path = opt_pkgshare/"skills"
    <<~EOS
      Optional agent skills were installed to:
        #{skill_path}

      Install with npx skills:
        npx -y skills add "#{skill_path}" --skill tk-task-list --agent codex -y --copy
        npx -y skills add "#{skill_path}" --skill tk-release --agent codex -y --copy

      Install from GitHub CLI v2.90.0+:
        gh skill install mkusaka/tk tk-task-list --agent codex
        gh skill install mkusaka/tk tk-release --agent codex

      Replace `--agent codex` with `--agent claude-code` if needed.
    EOS
  end

  test do
    assert_match "Structured task list CLI", shell_output("#{bin}/tk --help")
  end
end
