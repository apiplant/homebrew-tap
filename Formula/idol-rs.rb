# Generated from packaging/homebrew/idol-rs.rb in apiplant/idol-rs by the
# release workflow, which fills in the version and checksum and commits the
# result to apiplant/homebrew-tap as Formula/idol-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class IdolRs < Formula
  desc "One image to a 3D Gaussian splat on CUDA or Apple Silicon (Metal)"
  homepage "https://github.com/apiplant/idol-rs"
  version "0.1.0"
  license "Apache-2.0"

  # The release archives are the binaries; no source build or bottles.
  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sequoia
    on_arm do
      url "https://github.com/apiplant/idol-rs/releases/download/v0.1.0/idol-rs-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "8fa86df48dd4580acc6a2fcbc2f945777bf19da283f130a092d9970d33e66b83"
    end
  end
  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://github.com/apiplant/idol-rs/releases/download/v0.1.0/idol-rs-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e2581f28dd4be25de62e8ff6f09c705618ab126366b68a7555b4cb2fc3bd0aff"
    end
  end

  def install
    bin.install "idol"
    doc.install "README.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/idol --version")
  end
end
