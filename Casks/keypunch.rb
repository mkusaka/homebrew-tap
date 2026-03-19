cask "keypunch" do
  version "0.0.8"
  sha256 "da99e719e8d7339b6394579a67d832b92aa0de37c076887f74731068656116cb"

  url "https://github.com/mkusaka/keypunch/releases/download/v#{version}/Keypunch.zip"
  name "Keypunch"
  desc "macOS menu bar app that launches applications via global keyboard shortcuts"
  homepage "https://github.com/mkusaka/keypunch"

  app "Keypunch.app"

  zap trash: [
    "~/Library/Preferences/com.mkusaka.Keypunch.plist",
  ]
end
