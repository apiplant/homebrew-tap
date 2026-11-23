# Generated from packaging/homebrew/h3-rs.rb in apiplant/h3-rs by the
# release workflow, which fills in the version and checksum and commits the
# result to apiplant/homebrew-tap as Formula/h3-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class H3Rs < Formula
  desc "MiniMax H3 video with stereo audio on CUDA or Apple Silicon (MLX)"
  homepage "https://github.com/apiplant/h3-rs"
  version "0.6.0"
  license "Apache-2.0"

  # The release archives are the binaries; no source build or bottles.
  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sequoia
    on_arm do
      url "https://github.com/apiplant/h3-rs/releases/download/v0.6.0/h3-rs-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "3c03f2f551aecb23c4f60bc55f46c7b1f36640def2400a00b3e8598578f9f357"
    end
  end
  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://github.com/apiplant/h3-rs/releases/download/v0.6.0/h3-rs-v0.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "690ad65d6c5d945921c2e1598c04f5adf0df4cd4098cfce7e6c8211be3841da3"
    end
  end
  depends_on "ffmpeg"

  def install
    bin.install "h3"
    (share/"h3-rs").install "mlx.metallib" if OS.mac?
    doc.install "README.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/h3 --version")
  end
end
