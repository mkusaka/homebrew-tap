cask "joblet" do
  # Release automation replaces these placeholders after the first notarized tag.
  version "0.0.4"
  sha256 "f95a649e9b22cbec2cbfd7868b49149de4d12743970f8c3315cb21f0ea380f92"

  url "https://github.com/mkusaka/joblet/releases/download/v#{version}/Joblet.zip"
  name "Joblet"
  desc "Manage launchd LaunchAgents (scheduled jobs) with an MCP server for AI agents"
  homepage "https://github.com/mkusaka/joblet"

  depends_on macos: :sonoma

  app "Joblet.app"

  caveats <<~EOS
    Joblet is currently ad-hoc signed and not notarized. Allow the first launch in
    System Settings > Privacy & Security > Open Anyway, or run:
      xattr -dr com.apple.quarantine #{appdir}/Joblet.app
  EOS

  zap trash: [
    "~/Library/Preferences/io.github.mkusaka.Joblet.plist",
  ]
end
