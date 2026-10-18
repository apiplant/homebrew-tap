# Generated from packaging/homebrew/h3-rs.rb in apiplant/h3-rs by the
# release workflow, which fills in the version and checksum and commits the
# result to apiplant/homebrew-tap as Formula/h3-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class H3Rs < Formula
  desc "MiniMax H3 video with stereo audio on NVIDIA GPUs (CUDA)"
  homepage "https://github.com/apiplant/h3-rs"
  version "0.2.0"
  license "Apache-2.0"

  # Linux x86_64 only: the engine is CUDA. It needs an NVIDIA driver, the
  # CUDA 13 runtime (libcudart, libcublas, libnvrtc, libcurand) and ffmpeg on
  # the host; Homebrew cannot provide the driver or the CUDA libraries.
  depends_on :linux
  depends_on arch: :x86_64
  depends_on "ffmpeg"

  url "https://github.com/apiplant/h3-rs/releases/download/v0.2.0/h3-rs-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
  sha256 "42d42875a6e67af9edb8af6e17b8cf75bb6db50dc20de23fef5dbcb9c0867a6c"

  def install
    bin.install "h3"
    doc.install "README.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/h3 --version")
  end
end
