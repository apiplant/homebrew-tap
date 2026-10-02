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
      sha256 "57f776261529edd67eac762c44d501a16af8a0147c588ab64e0ff84aa7aae9d3"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/phonon-rs/releases/download/v0.1.1/phonon-rs-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "382b580a112c2d3857eaec38b26a9835920e79ca65183d9273ed1f121257640a"
    end
    on_arm do
      url "https://github.com/apiplant/phonon-rs/releases/download/v0.1.1/phonon-rs-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bf3b6f1208f97afdd94163357afa3141f50f25f1a9414b1c57f4076fa66e64ad"
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
