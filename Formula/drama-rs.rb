# Generated from packaging/homebrew/drama-rs.rb in apiplant/drama-rs by the
# release workflow, which fills in the version and checksum and commits the
# result to apiplant/homebrew-tap as Formula/drama-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class DramaRs < Formula
  desc "Fish Audio Drama 3 text-to-speech on a single 24 GB GPU (CUDA)"
  homepage "https://github.com/apiplant/drama-rs"
  version "0.1.0"
  license "Apache-2.0"

  # Linux x86_64 only: the engine is CUDA. It needs an NVIDIA driver and the
  # CUDA 12 runtime (libcudart, libcublas) on the host, which Homebrew cannot
  # provide.
  depends_on :linux
  depends_on arch: :x86_64

  url "https://github.com/apiplant/drama-rs/releases/download/v0.1.0/drama-rs-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
  sha256 "8bc6b0623e9b48880914a5bcf6b9e402300e6040feb601a1116afea2e87e3fca"

  def install
    bin.install "drama"
    doc.install "README.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/drama --version")
  end
end
