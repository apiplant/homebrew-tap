# Generated from packaging/homebrew/phonon-rs.rb in apiplant/phonon-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/phonon-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class PhononRs < Formula
  desc "Phonon-2 speech-to-text CLI and dictation daemon (candle)"
  homepage "https://github.com/apiplant/phonon-rs"
  version "0.1.4"
  license "Apache-2.0"

  # No bottles: the release archives *are* the binaries, so the formula only
  # unpacks what the tagged workflow already built for each platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/phonon-rs/releases/download/v0.1.4/phonon-rs-v0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "2bab4795500415b5407122460b45d931b64661cf98892b7af43c0f9f4ea9cf5f"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/phonon-rs/releases/download/v0.1.4/phonon-rs-v0.1.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a03a308cfb9a0d104a93df402bf3f608e6ac13979ef62d14cd8a97f2b4a9df80"
    end
    on_arm do
      url "https://github.com/apiplant/phonon-rs/releases/download/v0.1.4/phonon-rs-v0.1.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "196dad4c34d3bbd88e25cfb113e68bdd6fe6659b9a7c1b58b5a80f186b5ee0f2"
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
