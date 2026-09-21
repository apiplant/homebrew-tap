# Generated from packaging/homebrew/laya-rs.rb in apiplant/laya-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/laya-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class LayaRs < Formula
  desc "Rust (candle) inference for Laya's typed-decision engine"
  homepage "https://github.com/apiplant/laya-rs"
  version "0.2.0"
  license "Apache-2.0"

  # No bottles: the release archives *are* the binary, so the formula only
  # unpacks what the tagged workflow already built for each platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/laya-rs/releases/download/v0.2.0/laya-rs-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "f1ec076411ef99ca2cf1bd00d8d5f7fd676c2d9c7ce74a618ee5552fa1a7e95e"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/laya-rs/releases/download/v0.2.0/laya-rs-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7c5b856401a758194bba5adf1bbb77c89e57a6634a92e46a6aa9760f13f3de2e"
    end
    on_arm do
      url "https://github.com/apiplant/laya-rs/releases/download/v0.2.0/laya-rs-v0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c411e7fd543edbad68d925a92a6fdc0e8238165463ba406fc9dd710d3f01179b"
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
