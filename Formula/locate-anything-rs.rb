# Generated from packaging/homebrew/locate-anything-rs.rb in apiplant/locate-anything-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/locate-anything-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class LocateAnythingRs < Formula
  desc "Rust (candle) inference for nvidia/LocateAnything-3B visual grounding"
  homepage "https://github.com/apiplant/locate-anything-rs"
  version "0.1.2"
  license "Apache-2.0"

  # No bottles: the release archives *are* the binaries, so the formula only
  # unpacks what the tagged workflow already built for each platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/locate-anything-rs/releases/download/v0.1.2/locate-anything-rs-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "3563727ed7c6badf47631a5f6aadc1c881f3731223df63b6869da4336b9aabd3"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/locate-anything-rs/releases/download/v0.1.2/locate-anything-rs-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ce9512a21ec6e7f43046d129bda0e87c13e5a67d2e76887bd1044f543d2fb960"
    end
    on_arm do
      url "https://github.com/apiplant/locate-anything-rs/releases/download/v0.1.2/locate-anything-rs-v0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ac56be3e775ae5505160c46d5d3996009c8df1db9fe7b956682dcdc526811a3f"
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
