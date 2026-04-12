cask "keyglass" do
  # Release automation replaces these placeholders after the first notarized tag.
  version "0.0.1"
  sha256 "e1c3b84d368f2c1605b7e90933c40b73313215a08f91335fd52e8cf0945170e1"

  url "https://github.com/mkusaka/KeyGlass/releases/download/v#{version}/KeyGlass.zip"
  name "KeyGlass"
  desc "macOS menu bar utility for visualizing keyboard and mouse input"
  homepage "https://github.com/mkusaka/KeyGlass"

  app "KeyGlass.app"

  zap trash: [
    "~/Library/Preferences/com.mkusaka.KeyGlass.plist",
  ]
end
