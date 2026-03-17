cask "keypunch" do
  version "0.0.2"
  sha256 "621697cfc6a5382b0432c4f54dfa907b854887434798964fd7e3e94134754eab"

  url "https://github.com/mkusaka/keypunch/releases/download/v#{version}/Keypunch.zip"
  name "Keypunch"
  desc "macOS menu bar app that launches applications via global keyboard shortcuts"
  homepage "https://github.com/mkusaka/keypunch"

  app "Keypunch.app"

  zap trash: [
    "~/Library/Preferences/com.mkusaka.Keypunch.plist",
  ]
end
