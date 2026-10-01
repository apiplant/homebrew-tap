# Generated from packaging/homebrew/merge-safetensors-rs.rb in apiplant/merge-safetensors-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/merge-safetensors-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class MergeSafetensorsRs < Formula
  desc "Merge sharded .safetensors files into one, streaming"
  homepage "https://github.com/apiplant/merge-safetensors-rs"
  version "0.2.1"
  license "MIT"

  # No bottles: the release archives *are* the binaries, so the formula only
  # unpacks what the tagged workflow already built for each platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/merge-safetensors-rs/releases/download/v0.2.1/merge-safetensors-rs-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "40c6e3ee1280e2cda67e8ffcbcaf031f6b820dd1519658e3f92e8e4f2947c2e8"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/merge-safetensors-rs/releases/download/v0.2.1/merge-safetensors-rs-v0.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "12986bcef17e31e63fc886bcfc9ee908705788a74096f4abd3d5e54a0b78e480"
    end
    on_arm do
      url "https://github.com/apiplant/merge-safetensors-rs/releases/download/v0.2.1/merge-safetensors-rs-v0.2.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "18072db194b6cd78e159682a0946be92369ee9188301ace2a1487b26256235e3"
    end
  end

  def install
    bin.install "merge-safetensors"
    doc.install "README.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/merge-safetensors --version")
  end
end
