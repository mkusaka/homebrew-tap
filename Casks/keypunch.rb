cask "keypunch" do
  version "0.0.7"
  sha256 "4ec33d21a48b271c061962f4aa852ca09d9aefda0d80c2145ede8e7b923258a4"

  url "https://github.com/mkusaka/keypunch/releases/download/v#{version}/Keypunch.zip"
  name "Keypunch"
  desc "macOS menu bar app that launches applications via global keyboard shortcuts"
  homepage "https://github.com/mkusaka/keypunch"

  app "Keypunch.app"

  zap trash: [
    "~/Library/Preferences/com.mkusaka.Keypunch.plist",
  ]
end
