# Generated from packaging/homebrew/laya-rs.rb in apiplant/laya-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/laya-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class LayaRs < Formula
  desc "Rust (candle) inference for Laya's typed-decision engine"
  homepage "https://github.com/apiplant/laya-rs"
  version "0.3.0"
  license "Apache-2.0"

  # No bottles: the release archives *are* the binary, so the formula only
  # unpacks what the tagged workflow already built for each platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/laya-rs/releases/download/v0.3.0/laya-rs-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "176484e4aaf5c8d071112350ccdedec685352c8049802eded5c95d68c6bd4f75"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/laya-rs/releases/download/v0.3.0/laya-rs-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ba779229e95e2c6708058e28fb7c496c19e779292eff613e30cfcf2f16f4306a"
    end
    on_arm do
      url "https://github.com/apiplant/laya-rs/releases/download/v0.3.0/laya-rs-v0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0aa43bd8f68c3e913bd6fc149e421b9b73d665f079b54e081a8ea23c067c5b9b"
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
