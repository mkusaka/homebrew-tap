cask "keyglass" do
  # Release automation replaces these placeholders after the first notarized tag.
  version "0.0.8"
  sha256 "ea96c2bb43af8b7eab4e2ae76985ea436fd7f56420f143c5e5254cbe6f86208a"

  url "https://github.com/mkusaka/KeyGlass/releases/download/v#{version}/KeyGlass.zip"
  name "KeyGlass"
  desc "macOS menu bar utility for visualizing keyboard and mouse input"
  homepage "https://github.com/mkusaka/KeyGlass"

  app "KeyGlass.app"

  zap trash: [
    "~/Library/Preferences/com.mkusaka.KeyGlass.plist",
  ]
end
