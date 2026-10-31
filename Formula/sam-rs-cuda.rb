# Generated from packaging/homebrew/sam-rs-cuda.rb in apiplant/sam-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/sam-rs-cuda.rb. Changes belong in
# the source repository: the next release overwrites this file.
class SamRsCuda < Formula
  desc "Rust (candle) inference for Segment Anything models (SAM, SAM 2, SAM 3) (CUDA build)"
  homepage "https://github.com/apiplant/sam-rs"
  version "0.1.0"
  license "Apache-2.0"

  # Linux x86_64 only: no CUDA on Apple Silicon, and no arm64 CUDA build. It
  # needs an NVIDIA driver (libcuda) installed on the host, which Homebrew
  # cannot provide.
  depends_on :linux
  depends_on arch: :x86_64
  conflicts_with "sam-rs", because: "both install the same binaries"

  url "https://github.com/apiplant/sam-rs/releases/download/v0.1.0/sam-rs-cuda-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
  sha256 "dbea318af884660be033f4e8b9c395b0828213234ebbc69968a4a4f5931df454"

  def install
    bin.install "sam-rs"
    doc.install "README.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sam-rs --version")
  end
end
