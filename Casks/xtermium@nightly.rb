cask "xtermium@nightly" do
  version "20261111.082504"
  sha256 "64ed75a71bd51d2490f052bf851a5e2901d30b7e4373f8e19071fd6390b463f1"

  # One rolling pre-release: the file is replaced under this URL by each nightly build, and the
  # version is the build time from the release's name. bump.yml keeps both current.
  url "https://github.com/xtermium/xtermium/releases/download/nightly/xtermium_nightly_universal.dmg"
  name "xtermium Nightly"
  desc "Terminal and session manager with web/file browsers and AI (nightly build)"
  homepage "https://xtermium.com/"

  livecheck do
    url "https://api.github.com/repos/xtermium/xtermium/releases/tags/nightly"
    regex(/(\d{4})-(\d\d)-(\d\d) (\d\d):(\d\d):(\d\d)/)
    strategy :json do |json, regex|
      match = json["name"]&.match(regex)
      next if match.blank?

      "#{match[1]}#{match[2]}#{match[3]}.#{match[4]}#{match[5]}#{match[6]}"
    end
  end

  conflicts_with cask: "xtermium"

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
    A nightly build is main as it stands. It takes the release's place and opens the same data,
    ~/.xtermium (or $XTERMIUM_HOME): keep a backup you trust (Settings > Import and export).
    `brew uninstall --zap` deletes ~/.xtermium.
  EOS
end
