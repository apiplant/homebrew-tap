# Generated from packaging/homebrew/locate-anything-rs.rb in apiplant/locate-anything-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/locate-anything-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class LocateAnythingRs < Formula
  desc "Rust (candle) inference for nvidia/LocateAnything-3B visual grounding"
  homepage "https://github.com/apiplant/locate-anything-rs"
  version "0.1.1"
  license "Apache-2.0"

  # No bottles: the release archives *are* the binaries, so the formula only
  # unpacks what the tagged workflow already built for each platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/locate-anything-rs/releases/download/v0.1.1/locate-anything-rs-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "3f4ab424ca26068ef756ec0a56367d43eaa8454ce27bd81ee86065be5de0f6d8"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/locate-anything-rs/releases/download/v0.1.1/locate-anything-rs-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0b3df3efef60f5f246727b5ab6f20662dc98ace799d4bee222a85b25ba5fde5a"
    end
    on_arm do
      url "https://github.com/apiplant/locate-anything-rs/releases/download/v0.1.1/locate-anything-rs-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "684e631bc85b971a73f14c44cc0f669215df0b915f1d1d820e0831199676d27c"
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
