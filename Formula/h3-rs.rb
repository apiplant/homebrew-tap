# Generated from packaging/homebrew/h3-rs.rb in apiplant/h3-rs by the
# release workflow, which fills in the version and checksum and commits the
# result to apiplant/homebrew-tap as Formula/h3-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class H3Rs < Formula
  desc "MiniMax H3 video with stereo audio on CUDA or Apple Silicon (MLX)"
  homepage "https://github.com/apiplant/h3-rs"
  version "0.5.3"
  license "Apache-2.0"

  # The release archives are the binaries; no source build or bottles.
  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sequoia
    on_arm do
      url "https://github.com/apiplant/h3-rs/releases/download/v0.5.3/h3-rs-v0.5.3-aarch64-apple-darwin.tar.gz"
      sha256 "f83a9ceab0620cc2b95d212a4a005cb9f2cb4223509cb55f81af571822cd66bc"
    end
  end
  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://github.com/apiplant/h3-rs/releases/download/v0.5.3/h3-rs-v0.5.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "517424e09ad76b13d228c951ec4fb6939e58a83129d05ded5f4a160212347dce"
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
