# Generated from packaging/homebrew/apiplant.rb in apiplant/apiplant by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/apiplant.rb. Changes belong in the
# source repository: the next release overwrites this file.
class Apiplant < Formula
  desc "Point it at an app directory and it serves an API"
  homepage "https://github.com/apiplant/apiplant"
  version "0.9.0"
  license any_of: ["MIT", "Apache-2.0"]

  # There are no bottles: the release archives *are* the binaries, so the
  # formula only unpacks what the tagged workflow already built for each
  # platform. packaging/local-release.sh can add extra host-built assets later,
  # but this template stays aligned with the CI release matrix.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/apiplant/releases/download/v0.9.0/apiplant-v0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "4826fe2af3eac6e2be53bdcc90d9b8e8569b0b0cfd810c83e01db12155c80efd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/apiplant/apiplant/releases/download/v0.9.0/apiplant-v0.9.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "73b03fab2798d105e7c9469e241da334c09e338deb93d6fb045427b8a8267f53"
    end
    on_arm do
      url "https://github.com/apiplant/apiplant/releases/download/v0.9.0/apiplant-v0.9.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "65a8ae37db24f0384db6b9227ee06a0a062b99968ee7cfa3846636faab813e6f"
    end
  end

  def install
    bin.install "apiplant"
    doc.install "README.md"
  end

  def caveats
    <<~EOS
      `apiplant build` shells out to a toolchain per language — cargo for .rs,
      cc for .c, zig for .zig, go for .go — so install whichever your functions
      use. TypeScript needs nothing; it is transpiled in-process.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/apiplant version")
  end
end
