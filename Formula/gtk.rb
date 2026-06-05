class Gtk < Formula
  desc "BYO-credentials Google Tasks CLI"
  homepage "https://github.com/mkusaka/gtk"
  license "MIT"
on_macos do
  if Hardware::CPU.arm?
    url "https://github.com/mkusaka/gtk/releases/download/v0.0.2/gtk-0.0.2-darwin-arm64.tar.gz"
    sha256 "f4baaac9c56001c8686178920a7d91b95dc3cbef1a414015d7e51aec20bb8a11"
  else
    url "https://github.com/mkusaka/gtk/releases/download/v0.0.2/gtk-0.0.2-darwin-x64.tar.gz"
    sha256 "168d2b47530582be9e6924d979f35779675b1940b745c9caaede00d5451cba73"
  end
end

  version "0.0.2"
  head "https://github.com/mkusaka/gtk.git", branch: "main"

  head do
    depends_on "deno" => :build
    depends_on "node" => :build
    depends_on "pnpm" => :build
  end

  def install
    if build.head?
      target = Hardware::CPU.arm? ? "aarch64-apple-darwin" : "x86_64-apple-darwin"
      system "pnpm", "install", "--frozen-lockfile"
      system "pnpm", "build"
      system "pnpm", "prune", "--prod"
      system "deno", "compile", "--no-lock", "-A", "--node-modules-dir=auto", "--target=#{target}", "--output", "gtk", "dist/index.js"
    end

    bin.install "gtk"
    (pkgshare/"skills").install Dir["skills/*"]
  end

  def caveats
    skill_path = opt_pkgshare/"skills"
    <<~EOS
      Optional agent skills were installed to:
        #{skill_path}

      Install from the packaged skill files with npx skills:
        npx -y skills add "#{skill_path}" --skill gtk-google-tasks -y --copy

      Install from the repository with npx skills:
        npx -y skills add https://github.com/mkusaka/gtk --skill gtk-google-tasks -y

      Install from GitHub CLI v2.90.0+:
        gh skill install mkusaka/gtk gtk-google-tasks

      Add `--agent <host>` if you want to target a specific agent host.
    EOS
  end

  test do
    assert_match "BYO-credentials Google Tasks CLI", shell_output("#{bin}/gtk --help")
  end
end
