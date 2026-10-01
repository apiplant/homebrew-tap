# Generated from packaging/homebrew/merge-safetensors-rs.rb in apiplant/merge-safetensors-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/merge-safetensors-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class MergeSafetensorsRs < Formula
  desc "Merge sharded .safetensors files into one, streaming"
  homepage "https://github.com/apiplant/merge-safetensors-rs"
  version "0.2.0"
  license "MIT"

  # No bottles: the release archives *are* the binaries, so the formula only
  # unpacks what the tagged workflow already built for each platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/merge-safetensors-rs/releases/download/v0.2.0/merge-safetensors-rs-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "7ba493fec497abe0179aac0f88d4f0f6001b60e6e883ead6b6456b00a223dcae"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/merge-safetensors-rs/releases/download/v0.2.0/merge-safetensors-rs-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "64f58fb94d918d19178aef0abcb1978dfe35011d205b98349c1214096353b41e"
    end
    on_arm do
      url "https://github.com/apiplant/merge-safetensors-rs/releases/download/v0.2.0/merge-safetensors-rs-v0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c9bd6fcf1809b32d34617bfaabbcf3d33c12831e40da15e818ec1187dae62c91"
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
