# Generated from packaging/homebrew/fluid-speech-rs.rb in apiplant/fluid-speech-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/fluid-speech-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class FluidSpeechRs < Formula
  desc "Fluid Speech Mini speech-to-text CLI and dictation daemon (candle)"
  homepage "https://github.com/apiplant/fluid-speech-rs"
  version "0.1.0"
  license "Apache-2.0"

  # No bottles: the release archives *are* the binaries, so the formula only
  # unpacks what the tagged workflow already built for each platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/fluid-speech-rs/releases/download/v0.1.0/fluid-speech-rs-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "3114caca1c49a3fa77e3d9fe9e756582e6749a3f1cac9a9b6cbf337d4ad0bfa8"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/fluid-speech-rs/releases/download/v0.1.0/fluid-speech-rs-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "851a941641e4d47458b840ce89a7c4ec572c42b0df6fded57e99e6e0820b78b7"
    end
    on_arm do
      url "https://github.com/apiplant/fluid-speech-rs/releases/download/v0.1.0/fluid-speech-rs-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fb6e721adff7db11673c58af0cf3b3a9be416edf5f158ede141fbb412aae4036"
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
