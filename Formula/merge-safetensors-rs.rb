# Generated from packaging/homebrew/merge-safetensors-rs.rb in apiplant/merge-safetensors-rs by the
# release workflow, which fills in the version and checksums and commits the
# result to apiplant/homebrew-tap as Formula/merge-safetensors-rs.rb. Changes belong in
# the source repository: the next release overwrites this file.
class MergeSafetensorsRs < Formula
  desc "Merge sharded .safetensors files into one, streaming"
  homepage "https://github.com/apiplant/merge-safetensors-rs"
  version "0.2.2"
  license "MIT"

  # No bottles: the release archives *are* the binaries, so the formula only
  # unpacks what the tagged workflow already built for each platform.
  on_macos do
    on_arm do
      url "https://github.com/apiplant/merge-safetensors-rs/releases/download/v0.2.2/merge-safetensors-rs-v0.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "d1fba9b108dea8a1a1ba7dd514816a9845e801b4977a1c818da092e9e456ad1e"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/apiplant/merge-safetensors-rs/releases/download/v0.2.2/merge-safetensors-rs-v0.2.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f73e3e4cb3aca6b87059e8db2f50be6678801aa8d7e47ffc738dbaf884d78637"
    end
    on_arm do
      url "https://github.com/apiplant/merge-safetensors-rs/releases/download/v0.2.2/merge-safetensors-rs-v0.2.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "db62da2ea9cefd1d6049ba427589ec66a59936bdef00af4fccacc0606bd2916a"
    end
  end

  def install
    bin.install "merge-safetensors"
    doc.install "README.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/merge-safetensors --version")
  end
end
