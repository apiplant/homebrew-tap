# Generated from packaging/homebrew/julia1-rs.rb in apiplant/julia1-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/julia1-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class Julia1Rs < Formula
  desc "Rust CPU/CUDA inference runtime for the Julia-1 decision model"
  homepage "https://github.com/apiplant/julia1-rs"
  version "0.1.0"
  license "Apache-2.0"

  # No bottles: the release archives *are* the binaries, so the formula only
  # unpacks what the tagged workflow already built for each platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/julia1-rs/releases/download/v0.1.0/julia1-rs-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "d1de8e327b7eb7466268a4e261d718ee18ef5cc9cb407880452f8701c9c12627"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/julia1-rs/releases/download/v0.1.0/julia1-rs-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a02f02f067f54597db8fe32baf5cf8d972f4935e2bd23d37abc03dabe032ac10"
    end
    on_arm do
      url "https://github.com/apiplant/julia1-rs/releases/download/v0.1.0/julia1-rs-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "80c4a30f4a323dd86d824fea4401c0b718acd1a9b9d086ef43a40a0699c647c9"
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
