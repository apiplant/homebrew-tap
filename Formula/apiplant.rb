# Generated from packaging/homebrew/apiplant.rb in apiplant/apiplant by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/apiplant.rb. Changes belong in the
# source repository: the next release overwrites this file.
class Apiplant < Formula
  desc "Point it at an app directory and it serves an API"
  homepage "https://github.com/apiplant/apiplant"
  version "0.8.1"
  license any_of: ["MIT", "Apache-2.0"]

  # There are no bottles: the release archives *are* the binaries, so the
  # formula only unpacks what the tagged workflow already built for each
  # platform. packaging/local-release.sh can add extra host-built assets later,
  # but this template stays aligned with the CI release matrix.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/apiplant/releases/download/v0.8.1/apiplant-v0.8.1-aarch64-apple-darwin.tar.gz"
      sha256 "a0604f6f3c93aceab01b76dce6d175011c72432f4313f60d381d8d01b4d9504f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/apiplant/apiplant/releases/download/v0.8.1/apiplant-v0.8.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c3654fddb1e6ab4817eef6926bc1c14d5d18540b5b4241c74c69e2df72cce7e0"
    end
    on_arm do
      url "https://github.com/apiplant/apiplant/releases/download/v0.8.1/apiplant-v0.8.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "59f57e58e1b3504182f0c111d877a2695214e44a0e59534772ca036e746958ad"
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
