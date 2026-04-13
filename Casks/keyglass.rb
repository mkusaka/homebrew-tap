cask "keyglass" do
  # Release automation replaces these placeholders after the first notarized tag.
  version "0.0.11"
  sha256 "5f120d947b9d9fc0c22249e17b1a95afb4c532c78f02877dd969c3240918f5f6"

  url "https://github.com/mkusaka/KeyGlass/releases/download/v#{version}/KeyGlass.zip"
  name "KeyGlass"
  desc "macOS menu bar utility for visualizing keyboard and mouse input"
  homepage "https://github.com/mkusaka/KeyGlass"

  app "KeyGlass.app"

  zap trash: [
    "~/Library/Preferences/com.mkusaka.KeyGlass.plist",
  ]
end
