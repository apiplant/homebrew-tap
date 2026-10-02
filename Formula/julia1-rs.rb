# Generated from packaging/homebrew/julia1-rs.rb in apiplant/julia1-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/julia1-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class Julia1Rs < Formula
  desc "Rust CPU/CUDA inference runtime for the Julia-1 decision model"
  homepage "https://github.com/apiplant/julia1-rs"
  version "0.1.2"
  license "Apache-2.0"

  # No bottles: the release archives *are* the binaries, so the formula only
  # unpacks what the tagged workflow already built for each platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/julia1-rs/releases/download/v0.1.2/julia1-rs-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "19a0f646e8f2d9cf7a2d8eaa1449a7b8c41243fac4676991182c3a04cc824f05"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/julia1-rs/releases/download/v0.1.2/julia1-rs-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c5295e6275abdd36b8b26f7bf7f37d89f9af65c538a899a657ed5a2330263da9"
    end
    on_arm do
      url "https://github.com/apiplant/julia1-rs/releases/download/v0.1.2/julia1-rs-v0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0760d63f9c5564c7627e22dc7effb2b47e2d62553deaa6337e53c2e7744edd10"
    end
  end

  conflicts_with "julia1-rs-cuda", because: "both install the same binaries"

  def install
    bin.install "julia1"
    doc.install "README.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/julia1 --version")
  end
end
