cask "keyglass" do
  # Release automation replaces these placeholders after the first notarized tag.
  version "0.0.7"
  sha256 "2866c83ab00464bd1214192cc81f089ba8313509b85e5cdf21ebe2c6b691aa45"

  url "https://github.com/mkusaka/KeyGlass/releases/download/v#{version}/KeyGlass.zip"
  name "KeyGlass"
  desc "macOS menu bar utility for visualizing keyboard and mouse input"
  homepage "https://github.com/mkusaka/KeyGlass"

  app "KeyGlass.app"

  zap trash: [
    "~/Library/Preferences/com.mkusaka.KeyGlass.plist",
  ]
end
