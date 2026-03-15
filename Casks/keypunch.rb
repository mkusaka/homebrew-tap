cask "keypunch" do
  version "0.0.1"
  sha256 "73b8eb1065db7ea72fdd2497ba81a6f13946cd0036df49181fa1f24ef136432c"

  url "https://github.com/mkusaka/keypunch/releases/download/v#{version}/Keypunch.zip"
  name "Keypunch"
  desc "macOS menu bar app that launches applications via global keyboard shortcuts"
  homepage "https://github.com/mkusaka/keypunch"

  app "Keypunch.app"

  zap trash: [
    "~/Library/Preferences/com.mkusaka.Keypunch.plist",
  ]
end
