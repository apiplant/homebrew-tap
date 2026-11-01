# Generated from packaging/homebrew/sam-rs.rb in apiplant/sam-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/sam-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class SamRs < Formula
  desc "Rust (candle) inference for Segment Anything models (SAM, SAM 2, SAM 3)"
  homepage "https://github.com/apiplant/sam-rs"
  version "0.1.1"
  license "Apache-2.0"

  # No bottles: the release archives *are* the binaries, so the formula only
  # unpacks what the tagged workflow already built for each platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/sam-rs/releases/download/v0.1.1/sam-rs-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "213a70765bf125be95ee4642df7f9188d84823022130e8bc1bf4ceaab66e7e25"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/sam-rs/releases/download/v0.1.1/sam-rs-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cd6e11d1e7ff55f83a2a363a0f086398e166db60416b58d83a0aad687e4b275c"
    end
    on_arm do
      url "https://github.com/apiplant/sam-rs/releases/download/v0.1.1/sam-rs-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "06ea6718fa843895616e4dcd25f437f23941b91370d86991e8a90c2e11c51d09"
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
