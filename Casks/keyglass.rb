cask "keyglass" do
  # Release automation replaces these placeholders after the first notarized tag.
  version "0.0.0"
  sha256 "REPLACE_ME"

  url "https://github.com/mkusaka/KeyGlass/releases/download/v#{version}/KeyGlass.zip"
  name "KeyGlass"
  desc "macOS menu bar utility for visualizing keyboard and mouse input"
  homepage "https://github.com/mkusaka/KeyGlass"

  app "KeyGlass.app"

  zap trash: [
    "~/Library/Preferences/com.mkusaka.KeyGlass.plist",
  ]
end
