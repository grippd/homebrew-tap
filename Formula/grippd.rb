# Written by the grippd monorepo's release workflow (.github/workflows/release.yml), which
# sets `version` and each `sha256 "..." # <target>` line. Don't edit by hand.
# Until the first release this is a template: version 0.0.0 and placeholder checksums.
class Grippd < Formula
  desc "Infrastructure from one small grippd.yaml"
  homepage "https://grippd.sh"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/grippd/homebrew-tap/releases/download/cli-v#{version}/grippd-aarch64-apple-darwin.tar.gz"
      sha256 "1ba62d741a8caf4825faf931a51609f2ae339376f1cc9b5e8b34dfeca9ba3df5" # aarch64-apple-darwin
    end
    on_intel do
      url "https://github.com/grippd/homebrew-tap/releases/download/cli-v#{version}/grippd-x86_64-apple-darwin.tar.gz"
      sha256 "08f650b0a08ec31b9b6e036d93ce7de2b8498c252c9d04e7f9a7b76188db02c7" # x86_64-apple-darwin
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/grippd/homebrew-tap/releases/download/cli-v#{version}/grippd-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f7649731f09c83bb90a4f48bcd934fe667e0d184be43edf2f1cdd2d38b46c35a" # aarch64-unknown-linux-musl
    end
    on_intel do
      url "https://github.com/grippd/homebrew-tap/releases/download/cli-v#{version}/grippd-x86_64-unknown-linux-musl.tar.gz"
      sha256 "bedc840661b72b1b7f14f5f0dc3960bd04a2b74dc1aec21d7fd456d205015a48" # x86_64-unknown-linux-musl
    end
  end

  def install
    bin.install "grippd"
  end

  test do
    assert_equal "grippd #{version}", shell_output("#{bin}/grippd --version").strip
  end
end
