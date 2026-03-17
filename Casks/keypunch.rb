cask "keypunch" do
  version "0.0.4"
  sha256 "2fdc8db043edfc66e68be3786b7cb70ac22572c5ef403e984a1a0ff96a4d1b30"

  url "https://github.com/mkusaka/keypunch/releases/download/v#{version}/Keypunch.zip"
  name "Keypunch"
  desc "macOS menu bar app that launches applications via global keyboard shortcuts"
  homepage "https://github.com/mkusaka/keypunch"

  app "Keypunch.app"

  zap trash: [
    "~/Library/Preferences/com.mkusaka.Keypunch.plist",
  ]
end
