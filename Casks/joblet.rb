cask "joblet" do
  # Release automation replaces these placeholders after the first notarized tag.
  version "0.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/mkusaka/joblet/releases/download/v#{version}/Joblet.zip"
  name "Joblet"
  desc "Manage launchd LaunchAgents (scheduled jobs) with an MCP server for AI agents"
  homepage "https://github.com/mkusaka/joblet"

  depends_on macos: ">= :sonoma"

  app "Joblet.app"

  zap trash: [
    "~/Library/Preferences/io.github.mkusaka.Joblet.plist",
  ]
end
