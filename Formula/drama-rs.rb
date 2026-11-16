# Generated from packaging/homebrew/drama-rs.rb in apiplant/drama-rs by the
# release workflow, which fills in the version and checksum and commits the
# result to apiplant/homebrew-tap as Formula/drama-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class DramaRs < Formula
  desc "Fish Audio Drama 3 text-to-speech on CUDA or Apple Silicon (MLX)"
  homepage "https://github.com/apiplant/drama-rs"
  version "0.3.1"
  license "Apache-2.0"

  # The release archives are the binaries; no source build or bottles.
  on_macos do
    depends_on "ffmpeg"
    depends_on arch: :arm64
    depends_on macos: :sequoia
    on_arm do
      url "https://github.com/apiplant/drama-rs/releases/download/v0.3.1/drama-rs-v0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "0b2e772bc52fbe2bee34cf083ba99bd11c9ddbc4d6dd56a270634569bdc057f8"
    end
  end
  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://github.com/apiplant/drama-rs/releases/download/v0.3.1/drama-rs-v0.3.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "06eaf881881ecb6cc2420d2abfe154f46c057a3ce1296826393d41aab3edfba7"
    end
  end

  def install
    bin.install "drama"
    (share/"drama-rs").install "mlx.metallib" if OS.mac?
    doc.install "README.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/drama --version")
  end
end
