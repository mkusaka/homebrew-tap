cask "joblet" do
  # Release automation replaces these placeholders after the first notarized tag.
  version "0.0.5"
  sha256 "2347645ec2581443d4bbdf92d5e2087ce4c1124bc2be6ed21344e4a9aee44754"

  url "https://github.com/mkusaka/joblet/releases/download/v#{version}/Joblet.zip"
  name "Joblet"
  desc "Manage launchd LaunchAgents (scheduled jobs) with an MCP server for AI agents"
  homepage "https://github.com/mkusaka/joblet"

  depends_on macos: :sonoma

  app "Joblet.app"

  zap trash: [
    "~/Library/Preferences/io.github.mkusaka.Joblet.plist",
  ]
end
