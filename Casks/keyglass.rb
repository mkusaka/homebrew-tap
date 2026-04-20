cask "keyglass" do
  # Release automation replaces these placeholders after the first notarized tag.
  version "0.0.13"
  sha256 "36330da2910ae30faeda0830cac075fd1ca3c317ba5ec0372ae5ce9ec2adb929"

  url "https://github.com/mkusaka/KeyGlass/releases/download/v#{version}/KeyGlass.zip"
  name "KeyGlass"
  desc "macOS menu bar utility for visualizing keyboard and mouse input"
  homepage "https://github.com/mkusaka/KeyGlass"

  app "KeyGlass.app"

  zap trash: [
    "~/Library/Preferences/com.mkusaka.KeyGlass.plist",
  ]
end
