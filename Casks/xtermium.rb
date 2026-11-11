cask "xtermium" do
  version "0.9.0"
  sha256 "f32dfb30c85a15f6521f81b7af82c22fe87b4d9ccc00934ad62d4b651decba2a"

  url "https://github.com/xtermium/xtermium/releases/download/v#{version}/xtermium_#{version}_universal.dmg",
      verified: "github.com/xtermium/xtermium/"
  name "xtermium"
  desc "Terminal and session manager with web/file browsers and AI"
  homepage "https://xtermium.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "xtermium@nightly"

  app "xtermium.app"
  binary "#{appdir}/xtermium.app/Contents/MacOS/xtermium"

  zap trash: [
    "~/.xtermium",
    "~/Library/Application Support/com.xtermium.desktop",
    "~/Library/Application Support/xtermium",
    "~/Library/Caches/com.xtermium.desktop",
    "~/Library/HTTPStorages/com.xtermium.desktop",
    "~/Library/LaunchAgents/xtermium.plist",
    "~/Library/Preferences/com.xtermium.desktop.plist",
    "~/Library/Saved Application State/com.xtermium.desktop.savedState",
    "~/Library/WebKit/com.xtermium.desktop",
  ]

  caveats <<~EOS
    xtermium keeps sessions, keys and settings in ~/.xtermium (or $XTERMIUM_HOME).
    `brew uninstall --zap` deletes ~/.xtermium; back it up first (Settings > Import and export).
  EOS
end
