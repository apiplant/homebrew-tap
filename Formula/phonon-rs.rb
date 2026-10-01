# Generated from packaging/homebrew/phonon-rs.rb in apiplant/phonon-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/phonon-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class PhononRs < Formula
  desc "Phonon-2 speech-to-text CLI and dictation daemon (candle)"
  homepage "https://github.com/apiplant/phonon-rs"
  version "0.1.1"
  license "Apache-2.0"

  # No bottles: the release archives *are* the binaries, so the formula only
  # unpacks what the tagged workflow already built for each platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/phonon-rs/releases/download/v0.1.1/phonon-rs-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "4fb13e7ec6109d3581d33b0241276a358d6d6e30eb7aee7a548473b4fc9c81e3"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/phonon-rs/releases/download/v0.1.1/phonon-rs-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5bac69203006101c344567850ab77190ad450d803b6f54a55d48db22ab921e57"
    end
    on_arm do
      url "https://github.com/apiplant/phonon-rs/releases/download/v0.1.1/phonon-rs-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6cc214367f00d44435bd372338e4fa211649e1680ace79ae2997fa1eb831b03e"
    end
  end

  conflicts_with "phonon-rs-cuda", because: "both install the same binaries"

  def install
    bin.install "phonon"
    bin.install "phonon-dictate" if OS.linux?
    doc.install "README.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/phonon --version")
  end
end
