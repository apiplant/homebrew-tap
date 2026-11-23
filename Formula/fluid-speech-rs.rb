# Generated from packaging/homebrew/fluid-speech-rs.rb in apiplant/fluid-speech-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/fluid-speech-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class FluidSpeechRs < Formula
  desc "Fluid Speech Mini speech-to-text CLI and dictation daemon (candle)"
  homepage "https://github.com/apiplant/fluid-speech-rs"
  version "0.1.5"
  license "Apache-2.0"

  # No bottles: the release archives *are* the binaries, so the formula only
  # unpacks what the tagged workflow already built for each platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/fluid-speech-rs/releases/download/v0.1.5/fluid-speech-rs-v0.1.5-aarch64-apple-darwin.tar.gz"
      sha256 "8960481a0c4c2c96ee0d8495df7b4aed3c3c4a267531c9e7b27b90370245920f"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/fluid-speech-rs/releases/download/v0.1.5/fluid-speech-rs-v0.1.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "673904a1f13c7c5e412f33c672342230a9fe09944cf1aa487a73b0adad1e2c69"
    end
    on_arm do
      url "https://github.com/apiplant/fluid-speech-rs/releases/download/v0.1.5/fluid-speech-rs-v0.1.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "025de3f7bfcb90e0d1b2d921441d48467a0bfc1bb307e76bbdf5777f270d7ebf"
    end
  end

  conflicts_with "fluid-speech-rs-cuda", because: "both install the same binaries"

  def install
    bin.install "fluid-speech"
    bin.install "fluid-dictate"
    doc.install "README.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fluid-speech --version")
  end
end
