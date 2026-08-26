# Generated from packaging/homebrew/apiplant.rb in apiplant/apiplant by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/apiplant.rb. Changes belong in the
# source repository: the next release overwrites this file.
class Apiplant < Formula
  desc "Point it at an app directory and it serves an API"
  homepage "https://github.com/apiplant/apiplant"
  version "0.9.1"
  license any_of: ["MIT", "Apache-2.0"]

  # There are no bottles: the release archives *are* the binaries, so the
  # formula only unpacks what the tagged workflow already built for each
  # platform. packaging/local-release.sh can add extra host-built assets later,
  # but this template stays aligned with the CI release matrix.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/apiplant/releases/download/v0.9.1/apiplant-v0.9.1-aarch64-apple-darwin.tar.gz"
      sha256 "92cda44dbd92a3dd144a1f57a19c11504373c513bfdda4be6046cd6a1b512918"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/apiplant/apiplant/releases/download/v0.9.1/apiplant-v0.9.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "65b252799fb2563bebd6b54a20fd4f5492690ddcf47a566717993dbb19b118ae"
    end
    on_arm do
      url "https://github.com/apiplant/apiplant/releases/download/v0.9.1/apiplant-v0.9.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "783018a13351c64398ec8efab1a3431e1736ac1eb6ae482b2aa99edbde8dba74"
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
