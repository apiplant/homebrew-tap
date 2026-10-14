# Generated from packaging/homebrew/fluid-speech-rs.rb in apiplant/fluid-speech-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/fluid-speech-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class FluidSpeechRs < Formula
  desc "Fluid Speech Mini speech-to-text CLI and dictation daemon (candle)"
  homepage "https://github.com/apiplant/fluid-speech-rs"
  version "0.1.4"
  license "Apache-2.0"

  # No bottles: the release archives *are* the binaries, so the formula only
  # unpacks what the tagged workflow already built for each platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/fluid-speech-rs/releases/download/v0.1.4/fluid-speech-rs-v0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "1e12c485504edd355ca4850777cb53efc096558f6ebaa291dc940d220f14b9d4"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/fluid-speech-rs/releases/download/v0.1.4/fluid-speech-rs-v0.1.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "41c1f999da514eb623263ab91133b7ff36244165d80328f2353b89d3e1c7c784"
    end
    on_arm do
      url "https://github.com/apiplant/fluid-speech-rs/releases/download/v0.1.4/fluid-speech-rs-v0.1.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e05aa1ddadfcb049593d2889ac2d9cbc7c0a5e513c6af8f38f1c212d88d7ef54"
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
