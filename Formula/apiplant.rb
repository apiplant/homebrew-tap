# Generated from packaging/homebrew/apiplant.rb in apiplant/apiplant by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/apiplant.rb. Changes belong in the
# source repository: the next release overwrites this file.
class Apiplant < Formula
  desc "Point it at an app directory and it serves an API"
  homepage "https://github.com/apiplant/apiplant"
  version "0.8.2"
  license any_of: ["MIT", "Apache-2.0"]

  # There are no bottles: the release archives *are* the binaries, so the
  # formula only unpacks what the tagged workflow already built for each
  # platform. packaging/local-release.sh can add extra host-built assets later,
  # but this template stays aligned with the CI release matrix.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/apiplant/releases/download/v0.8.2/apiplant-v0.8.2-aarch64-apple-darwin.tar.gz"
      sha256 "2f667061e10ed253c1a8b31bfef90d7680be3dfb4a71d5e24f5341480e69d8c7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/apiplant/apiplant/releases/download/v0.8.2/apiplant-v0.8.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "acfdccf3bac450db836666a3a8cdf8e7b0f3cf5bb6b7f121e9a15baa4bb13dbe"
    end
    on_arm do
      url "https://github.com/apiplant/apiplant/releases/download/v0.8.2/apiplant-v0.8.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1aa1192f5d02f8e18f430f99e625309bdab0925209864d3496e201d34fc9ec73"
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
