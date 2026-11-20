# Written by the grippd monorepo's release workflow (.github/workflows/release.yml), which
# sets `version` and each `sha256 "..." # <target>` line. Don't edit by hand.
# Until the first release this is a template: version 0.0.0 and placeholder checksums.
class Grippd < Formula
  desc "Infrastructure from one small grippd.yaml"
  homepage "https://grippd.sh"
  version "0.3.3"

  on_macos do
    on_arm do
      url "https://github.com/grippd/homebrew-tap/releases/download/cli-v#{version}/grippd-aarch64-apple-darwin.tar.gz"
      sha256 "2ba1de1479bee50a50036812932e18410bb6587c3382dd1759639a4325cf7df3" # aarch64-apple-darwin
    end
    on_intel do
      url "https://github.com/grippd/homebrew-tap/releases/download/cli-v#{version}/grippd-x86_64-apple-darwin.tar.gz"
      sha256 "83a54abcf50f997c0d6e25955b79ede079abb487e34c2edfd97423ce5bf4b22f" # x86_64-apple-darwin
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/grippd/homebrew-tap/releases/download/cli-v#{version}/grippd-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6f414bef98274a29d55b42111a656dbec8a883faa1489c5c18016dfd109ad1ec" # aarch64-unknown-linux-musl
    end
    on_intel do
      url "https://github.com/grippd/homebrew-tap/releases/download/cli-v#{version}/grippd-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d65ed6d85dcba472f01bcadc986ebafb3d615df157b79a12b60ab8504c3d0f0d" # x86_64-unknown-linux-musl
    end
  end

  def install
    bin.install "grippd"
  end

  test do
    assert_equal "grippd #{version}", shell_output("#{bin}/grippd --version").strip
  end
end
