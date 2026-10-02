# Generated from packaging/homebrew/phonon-rs.rb in apiplant/phonon-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/phonon-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class PhononRs < Formula
  desc "Phonon-2 speech-to-text CLI and dictation daemon (candle)"
  homepage "https://github.com/apiplant/phonon-rs"
  version "0.1.3"
  license "Apache-2.0"

  # No bottles: the release archives *are* the binaries, so the formula only
  # unpacks what the tagged workflow already built for each platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/phonon-rs/releases/download/v0.1.3/phonon-rs-v0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "c6d11e97393cf3b67f55611a3407f3995e2c10fe308b1508c0cf90ce3ade7568"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/phonon-rs/releases/download/v0.1.3/phonon-rs-v0.1.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4095803baf5859b9f29c95a10c2dbcaf27431ad3977aed4c593bd700896b0b6b"
    end
    on_arm do
      url "https://github.com/apiplant/phonon-rs/releases/download/v0.1.3/phonon-rs-v0.1.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ed536cbae08104e53b6b390b3d26d007a674433146d8eef5c5715b156b93dcc1"
    end
  end

  conflicts_with "phonon-rs-cuda", because: "both install the same binaries"

  def install
    bin.install "phonon"
    bin.install "phonon-dictate"
    doc.install "README.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/phonon --version")
  end
end
