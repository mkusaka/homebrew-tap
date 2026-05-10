cask "keyglass" do
  # Release automation replaces these placeholders after the first notarized tag.
  version "0.0.14"
  sha256 "d1edab21c0ac1a51fc0bc08b92e08953deaa874d29c769f595e7a9337e31beb3"

  url "https://github.com/mkusaka/KeyGlass/releases/download/v#{version}/KeyGlass.zip"
  name "KeyGlass"
  desc "macOS menu bar utility for visualizing keyboard and mouse input"
  homepage "https://github.com/mkusaka/KeyGlass"

  app "KeyGlass.app"

  zap trash: [
    "~/Library/Preferences/com.mkusaka.KeyGlass.plist",
  ]
end
