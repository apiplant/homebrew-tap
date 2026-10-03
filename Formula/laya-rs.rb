# Generated from packaging/homebrew/laya-rs.rb in apiplant/laya-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/laya-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class LayaRs < Formula
  desc "Rust (candle) inference for Laya's typed-decision engine"
  homepage "https://github.com/apiplant/laya-rs"
  version "0.4.0"
  license "Apache-2.0"

  # No bottles: the release archives *are* the binary, so the formula only
  # unpacks what the tagged workflow already built for each platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/laya-rs/releases/download/v0.4.0/laya-rs-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "624483ecd72b90cb722516c5d12cbeb37cf81551498213a13d0ee3cda9f14032"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/laya-rs/releases/download/v0.4.0/laya-rs-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ee11362ce31a3f8159544f46c2f622717bed040b94e2fc32d0b3ec16ad0b1079"
    end
    on_arm do
      url "https://github.com/apiplant/laya-rs/releases/download/v0.4.0/laya-rs-v0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5e7a0f1cbd8b746a6c39bc28889ad08becd1ef079ff815a0eb9a546ad3b3052d"
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
