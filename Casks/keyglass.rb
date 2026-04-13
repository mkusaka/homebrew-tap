cask "keyglass" do
  # Release automation replaces these placeholders after the first notarized tag.
  version "0.0.10"
  sha256 "b4915d6d39f52ff594ff81b156417876b6ce551eb1c6b9c080a3af48af87dd52"

  url "https://github.com/mkusaka/KeyGlass/releases/download/v#{version}/KeyGlass.zip"
  name "KeyGlass"
  desc "macOS menu bar utility for visualizing keyboard and mouse input"
  homepage "https://github.com/mkusaka/KeyGlass"

  app "KeyGlass.app"

  zap trash: [
    "~/Library/Preferences/com.mkusaka.KeyGlass.plist",
  ]
end
