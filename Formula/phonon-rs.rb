# Generated from packaging/homebrew/phonon-rs.rb in apiplant/phonon-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/phonon-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class PhononRs < Formula
  desc "Phonon-2.5 speech-to-text CLI and dictation daemon (candle)"
  homepage "https://github.com/apiplant/phonon-rs"
  version "0.2.0"
  license "Apache-2.0"

  # No bottles: the release archives *are* the binaries, so the formula only
  # unpacks what the tagged workflow already built for each platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/phonon-rs/releases/download/v0.2.0/phonon-rs-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "bb5abf9815ef73c956e52a5f6cb4c2d98e382d2483102e5fd6ce0ba4a1e97f4b"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/phonon-rs/releases/download/v0.2.0/phonon-rs-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5adb50c06d21cfe78910600076d02c027fe13489154851e2e47ac22cd736f13e"
    end
    on_arm do
      url "https://github.com/apiplant/phonon-rs/releases/download/v0.2.0/phonon-rs-v0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1b2b4d3f6186161f0f4d330857482205929aa0c6572f3deeeab4c84cf1fdac81"
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
