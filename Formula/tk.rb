class Tk < Formula
  desc "Standalone Rust CLI for persistent structured task lists"
  homepage "https://github.com/mkusaka/tk"
  # Release automation replaces these placeholders after the first tagged release.
  url "https://github.com/mkusaka/tk/archive/refs/tags/v0.0.3.tar.gz"
  version "0.0.3"
  sha256 "20273c5c50f6bc0943b641f2290b9728fbdc6c4a7c1ed15e8dd0a159823412f2"
  license "MIT"
  head "https://github.com/mkusaka/tk.git", branch: "main"

  bottle do
    root_url "https://github.com/mkusaka/tk/releases/download/v0.0.3"
    sha256 arm64_tahoe: "46a4b12715c65b78fb43f6856025b0b32619abd317b94c24b117551bb2b23ff6"
    sha256 tahoe: "2ee5197fd3d63c675f44c445084caf8e2fae0edafaec15d264858c97917b3d78"
    sha256 arm64_sequoia: "e87fee3bf5b9893b408909ad90962d34141fa1129b408922f5910f1fa93a1652"
    sha256 sequoia: "599c85209659b33effa44d2f5667a928c03ca9eeeba198c3f5a75cc0eee1c64e"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    (pkgshare/"skills").install buildpath/"skills/tk-task-list"
  end

  def caveats
    skill_path = opt_pkgshare/"skills"
    <<~EOS
      Optional agent skills were installed to:
        #{skill_path}

      Install from the packaged skill files with npx skills:
        npx -y skills add "#{skill_path}" --skill tk-task-list -y --copy

      Install from the repository with npx skills:
        npx -y skills add https://github.com/mkusaka/tk --skill tk-task-list -y

      Install from GitHub CLI v2.90.0+:
        gh skill install mkusaka/tk tk-task-list

      Add `--agent <host>` if you want to target a specific agent host.
    EOS
  end

  test do
    assert_match "Structured task list CLI", shell_output("#{bin}/tk --help")
  end
end
