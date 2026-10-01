# Generated from packaging/homebrew/locate-anything-rs.rb in apiplant/locate-anything-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/locate-anything-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class LocateAnythingRs < Formula
  desc "Rust (candle) inference for nvidia/LocateAnything-3B visual grounding"
  homepage "https://github.com/apiplant/locate-anything-rs"
  version "0.1.0"
  license "Apache-2.0"

  # No bottles: the release archives *are* the binaries, so the formula only
  # unpacks what the tagged workflow already built for each platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/locate-anything-rs/releases/download/v0.1.0/locate-anything-rs-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "027e93c71fd7589c3a15b075d2c67feab7335721bbf15f7e419704e681938acf"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/locate-anything-rs/releases/download/v0.1.0/locate-anything-rs-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "44be731430189dc104b46557724c0c5dab1f4b5ba35dd5090a38fc565aac294a"
    end
    on_arm do
      url "https://github.com/apiplant/locate-anything-rs/releases/download/v0.1.0/locate-anything-rs-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "209975114edaea6efbe0ea1607e35a0d7a86d438f58c07ea33da0426948952b3"
    end
  end

  conflicts_with "locate-anything-rs-cuda", because: "both install the same binaries"

  def install
    bin.install "locate-anything"
    doc.install "README.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/locate-anything --version")
  end
end
