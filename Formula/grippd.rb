# Written by the grippd monorepo's release workflow (.github/workflows/release.yml), which
# sets `version` and each `sha256 "..." # <target>` line. Don't edit by hand.
# Until the first release this is a template: version 0.0.0 and placeholder checksums.
class Grippd < Formula
  desc "Infrastructure from one small grippd.yaml"
  homepage "https://grippd.sh"
  version "0.0.0"

  on_macos do
    on_arm do
      url "https://github.com/grippd/homebrew-tap/releases/download/cli-v#{version}/grippd-aarch64-apple-darwin.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000" # aarch64-apple-darwin
    end
    on_intel do
      url "https://github.com/grippd/homebrew-tap/releases/download/cli-v#{version}/grippd-x86_64-apple-darwin.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000" # x86_64-apple-darwin
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/grippd/homebrew-tap/releases/download/cli-v#{version}/grippd-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000" # aarch64-unknown-linux-musl
    end
    on_intel do
      url "https://github.com/grippd/homebrew-tap/releases/download/cli-v#{version}/grippd-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000" # x86_64-unknown-linux-musl
    end
  end

  def install
    bin.install "grippd"
  end

  test do
    assert_equal "grippd #{version}", shell_output("#{bin}/grippd --version").strip
  end
end
