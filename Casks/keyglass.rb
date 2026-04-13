cask "keyglass" do
  # Release automation replaces these placeholders after the first notarized tag.
  version "0.0.2"
  sha256 "1a7118e91467959c1e298aa5c7593da7a4414afe19086861d539b6225b4ca47f"

  url "https://github.com/mkusaka/KeyGlass/releases/download/v#{version}/KeyGlass.zip"
  name "KeyGlass"
  desc "macOS menu bar utility for visualizing keyboard and mouse input"
  homepage "https://github.com/mkusaka/KeyGlass"

  app "KeyGlass.app"

  zap trash: [
    "~/Library/Preferences/com.mkusaka.KeyGlass.plist",
  ]
end
