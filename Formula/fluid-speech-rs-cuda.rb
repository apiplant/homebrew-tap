# Generated from packaging/homebrew/fluid-speech-rs-cuda.rb in apiplant/fluid-speech-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/fluid-speech-rs-cuda.rb. Changes belong in
# the source repository: the next release overwrites this file.
class FluidSpeechRsCuda < Formula
  desc "Fluid Speech Mini speech-to-text CLI and dictation daemon (candle) (CUDA build)"
  homepage "https://github.com/apiplant/fluid-speech-rs"
  version "0.1.4"
  license "Apache-2.0"

  # Linux x86_64 only: no CUDA on Apple Silicon, and no arm64 CUDA build. It
  # needs an NVIDIA driver (libcuda) installed on the host, which Homebrew
  # cannot provide.
  depends_on :linux
  depends_on arch: :x86_64
  conflicts_with "fluid-speech-rs", because: "both install the same binaries"

  url "https://github.com/apiplant/fluid-speech-rs/releases/download/v0.1.4/fluid-speech-rs-cuda-v0.1.4-x86_64-unknown-linux-gnu.tar.gz"
  sha256 "d2ac0ad64f58c20d049cc40783c37b095db1f836a83f43f6464a78ad4d5e74a5"

  def install
    bin.install "fluid-speech"
    bin.install "fluid-dictate"
    doc.install "README.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fluid-speech --version")
  end
end
