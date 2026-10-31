# Generated from packaging/homebrew/sam-rs.rb in apiplant/sam-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/sam-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class SamRs < Formula
  desc "Rust (candle) inference for Segment Anything models (SAM, SAM 2, SAM 3)"
  homepage "https://github.com/apiplant/sam-rs"
  version "0.1.0"
  license "Apache-2.0"

  # No bottles: the release archives *are* the binaries, so the formula only
  # unpacks what the tagged workflow already built for each platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/sam-rs/releases/download/v0.1.0/sam-rs-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "731af95614c9867ea96102e6e28684397064a586889cad566b1163e95f2bc4ef"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/sam-rs/releases/download/v0.1.0/sam-rs-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c399102ad2ed442995398b209a7a13d39584d4278b09e0a0b09ff6d66f76f704"
    end
    on_arm do
      url "https://github.com/apiplant/sam-rs/releases/download/v0.1.0/sam-rs-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "545ba619c0b3e53da0b08703554e2367c68f030f8c816423c39f4215387166d6"
    end
  end

  conflicts_with "sam-rs-cuda", because: "both install the same binaries"

  def install
    bin.install "sam-rs"
    doc.install "README.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sam-rs --version")
  end
end
