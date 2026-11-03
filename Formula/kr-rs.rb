# Generated from packaging/homebrew/kr-rs.rb in apiplant/kr-rs by the release
# workflow, which fills in the version and checksums and commits the result to
# apiplant/homebrew-tap as Formula/kr-rs.rb. Changes belong in the source
# repository: the next release overwrites this file.
class KrRs < Formula
  desc "Kubernetes in one static binary: no libc, no third-party crates"
  homepage "https://github.com/apiplant/kr-rs"
  version "0.1.3"
  license "Apache-2.0"

  # The release archives are the binaries; no source build or bottles. kr is
  # Linux only (namespaces, cgroup v2, overlayfs).
  on_linux do
    on_intel do
      url "https://github.com/apiplant/kr-rs/releases/download/v0.1.3/kr-rs-v0.1.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "59d7b6d0c8c30d2be5a14d5e64c4fb16925bd1fa2507ff79298b1a26d054d727"
    end
    on_arm do
      url "https://github.com/apiplant/kr-rs/releases/download/v0.1.3/kr-rs-v0.1.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3ea1cade86f5307caf2e472ab3c1f727d6e3dbdae262b09991bca3a3e342d175"
    end
  end

  def install
    bin.install "kr"
    (share/"kr-rs").install Dir["systemd/*"]
    doc.install "README.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kr version")
  end
end
