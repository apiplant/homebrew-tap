# Generated from packaging/homebrew/laya-rs.rb in apiplant/laya-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/laya-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class LayaRs < Formula
  desc "Rust (candle) inference for Laya's typed-decision engine"
  homepage "https://github.com/apiplant/laya-rs"
  version "0.3.1"
  license "Apache-2.0"

  # No bottles: the release archives *are* the binary, so the formula only
  # unpacks what the tagged workflow already built for each platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/laya-rs/releases/download/v0.3.1/laya-rs-v0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "3d05be14e33de7cd23768e964165ad27caf7092471e20ede117ac7d6eb38e422"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/laya-rs/releases/download/v0.3.1/laya-rs-v0.3.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "af20690d5c31b0c52167d160bab261bf8c132986dac5537ccdb9c78ec7487e2f"
    end
    on_arm do
      url "https://github.com/apiplant/laya-rs/releases/download/v0.3.1/laya-rs-v0.3.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6b8e952b0c32d42a63b5608e8be52b307c68f3053bc2b2d4217aba04fb54c868"
    end
  end

  def install
    bin.install "laya"
    doc.install "README.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/laya --version").split(" ").last
  end
end
