cask "keyglass" do
  # Release automation replaces these placeholders after the first notarized tag.
  version "0.0.12"
  sha256 "2e6a4a6205d85fc167a4a288b2243b39eacba9174594a9efd84b1f87e3662e1a"

  url "https://github.com/mkusaka/KeyGlass/releases/download/v#{version}/KeyGlass.zip"
  name "KeyGlass"
  desc "macOS menu bar utility for visualizing keyboard and mouse input"
  homepage "https://github.com/mkusaka/KeyGlass"

  app "KeyGlass.app"

  zap trash: [
    "~/Library/Preferences/com.mkusaka.KeyGlass.plist",
  ]
end
