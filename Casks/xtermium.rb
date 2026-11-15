cask "xtermium" do
  version "0.10.0"
  sha256 "af95d79039f94999f20b1cb11b18aaec10d601c7c71c25ce498a74f6400276d2"

  url "https://github.com/xtermium/xtermium/releases/download/v#{version}/xtermium_#{version}_universal.dmg"
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
