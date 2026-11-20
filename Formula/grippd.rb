# Written by the grippd monorepo's release workflow (.github/workflows/release.yml), which
# sets `version` and each `sha256 "..." # <target>` line. Don't edit by hand.
# Until the first release this is a template: version 0.0.0 and placeholder checksums.
class Grippd < Formula
  desc "Infrastructure from one small grippd.yaml"
  homepage "https://grippd.sh"
  version "0.3.1"

  on_macos do
    on_arm do
      url "https://github.com/grippd/homebrew-tap/releases/download/cli-v#{version}/grippd-aarch64-apple-darwin.tar.gz"
      sha256 "b7d117fb09d9f8d72ead3197404fa08237ed3f511012b651956a27a6b67964a2" # aarch64-apple-darwin
    end
    on_intel do
      url "https://github.com/grippd/homebrew-tap/releases/download/cli-v#{version}/grippd-x86_64-apple-darwin.tar.gz"
      sha256 "411ec1d866c10b86e30af89cc49d14b1eb02d51d981a72d6ec17bc98341e2a9f" # x86_64-apple-darwin
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/grippd/homebrew-tap/releases/download/cli-v#{version}/grippd-aarch64-unknown-linux-musl.tar.gz"
      sha256 "25c5d893e04d07694c5c3c38965465717e898e80b7b721aaf631278c5e6671bd" # aarch64-unknown-linux-musl
    end
    on_intel do
      url "https://github.com/grippd/homebrew-tap/releases/download/cli-v#{version}/grippd-x86_64-unknown-linux-musl.tar.gz"
      sha256 "853138e20a5d69a8fa8dc8f73b45945449b9b92d1ef86326040bf6a4bd0e5736" # x86_64-unknown-linux-musl
    end
  end

  def install
    bin.install "grippd"
  end

  test do
    assert_equal "grippd #{version}", shell_output("#{bin}/grippd --version").strip
  end
end
