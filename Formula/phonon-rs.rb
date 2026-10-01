# Generated from packaging/homebrew/phonon-rs.rb in apiplant/phonon-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/phonon-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class PhononRs < Formula
  desc "Phonon-2 speech-to-text CLI and dictation daemon (candle)"
  homepage "https://github.com/apiplant/phonon-rs"
  version "0.1.0"
  license "Apache-2.0"

  # No bottles: the release archives *are* the binaries, so the formula only
  # unpacks what the tagged workflow already built for each platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/phonon-rs/releases/download/v0.1.0/phonon-rs-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "133113820f2c698aab1b1f3690f3d0a45425ba5471f4c0d1d3e042c5aea4e451"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/phonon-rs/releases/download/v0.1.0/phonon-rs-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "27137be52f6d3052768b039c5c6707089bc980e34c0dc4fd1d0aee4813807b7e"
    end
    on_arm do
      url "https://github.com/apiplant/phonon-rs/releases/download/v0.1.0/phonon-rs-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bc0ab0466cf46126a702065b3142a4f683984e8715e89b04247caeed67b4ba42"
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
