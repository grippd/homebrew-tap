# Written by the grippd monorepo's release workflow (.github/workflows/release.yml), which
# sets `version` and each `sha256 "..." # <target>` line. Don't edit by hand.
# Until the first release this is a template: version 0.0.0 and placeholder checksums.
class Grippd < Formula
  desc "Infrastructure from one small grippd.yaml"
  homepage "https://grippd.sh"
  version "0.3.2"

  on_macos do
    on_arm do
      url "https://github.com/grippd/homebrew-tap/releases/download/cli-v#{version}/grippd-aarch64-apple-darwin.tar.gz"
      sha256 "14bb432809b46501e16528034116008e147565ca9f2875055e3024b2e603b07b" # aarch64-apple-darwin
    end
    on_intel do
      url "https://github.com/grippd/homebrew-tap/releases/download/cli-v#{version}/grippd-x86_64-apple-darwin.tar.gz"
      sha256 "db1d8242c5a285fb21accc8067c36c0fe23603052973157af8b2317179cf0ba0" # x86_64-apple-darwin
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/grippd/homebrew-tap/releases/download/cli-v#{version}/grippd-aarch64-unknown-linux-musl.tar.gz"
      sha256 "04f4f2c17a80fdc2c03c0e1bfb732f96e861545879ba2c3dc48af8c2b3af34b7" # aarch64-unknown-linux-musl
    end
    on_intel do
      url "https://github.com/grippd/homebrew-tap/releases/download/cli-v#{version}/grippd-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a3812bdaabee1439348c2080900928d9f0268a58ba5f92cb075f2af22c37a1b8" # x86_64-unknown-linux-musl
    end
  end

  def install
    bin.install "grippd"
  end

  test do
    assert_equal "grippd #{version}", shell_output("#{bin}/grippd --version").strip
  end
end
