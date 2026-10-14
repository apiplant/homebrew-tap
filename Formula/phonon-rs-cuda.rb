# Generated from packaging/homebrew/phonon-rs-cuda.rb in apiplant/phonon-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/phonon-rs-cuda.rb. Changes belong in
# the source repository: the next release overwrites this file.
class PhononRsCuda < Formula
  desc "Phonon-2 speech-to-text CLI and dictation daemon (candle) (CUDA build)"
  homepage "https://github.com/apiplant/phonon-rs"
  version "0.1.4"
  license "Apache-2.0"

  # Linux x86_64 only: no CUDA on Apple Silicon, and no arm64 CUDA build. It
  # needs an NVIDIA driver (libcuda) installed on the host, which Homebrew
  # cannot provide.
  depends_on :linux
  depends_on arch: :x86_64
  conflicts_with "phonon-rs", because: "both install the same binaries"

  url "https://github.com/apiplant/phonon-rs/releases/download/v0.1.4/phonon-rs-cuda-v0.1.4-x86_64-unknown-linux-gnu.tar.gz"
  sha256 "77de0cfebc2459eef1d2297f103d19f87a2910b2c35e277ed25800c314e9a772"

  def install
    bin.install "phonon"
    bin.install "phonon-dictate"
    doc.install "README.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/phonon --version")
  end
end
