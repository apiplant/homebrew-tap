# Generated from packaging/homebrew/julia1-rs-cuda.rb in apiplant/julia1-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/julia1-rs-cuda.rb. Changes belong in
# the source repository: the next release overwrites this file.
class Julia1RsCuda < Formula
  desc "Rust CPU/CUDA inference runtime for the Julia-1 decision model (CUDA build)"
  homepage "https://github.com/apiplant/julia1-rs"
  version "0.2.1"
  license "Apache-2.0"

  # Linux x86_64 only: no CUDA on Apple Silicon, and no arm64 CUDA build. It
  # needs an NVIDIA driver (libcuda) installed on the host, which Homebrew
  # cannot provide.
  depends_on :linux
  depends_on arch: :x86_64
  conflicts_with "julia1-rs", because: "both install the same binaries"

  url "https://github.com/apiplant/julia1-rs/releases/download/v0.2.1/julia1-rs-cuda-v0.2.1-x86_64-unknown-linux-gnu.tar.gz"
  sha256 "94340a58fcf7e44ae8101f53ad2b7b842679cfae856703ddaef4fe36fbc56fbf"

  def install
    bin.install "julia1"
    doc.install "README.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/julia1 --version")
  end
end
