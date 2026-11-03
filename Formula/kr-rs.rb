# Generated from packaging/homebrew/kr-rs.rb in apiplant/kr-rs by the release
# workflow, which fills in the version and checksums and commits the result to
# apiplant/homebrew-tap as Formula/kr-rs.rb. Changes belong in the source
# repository: the next release overwrites this file.
class KrRs < Formula
  desc "Kubernetes in one static binary: no libc, no third-party crates"
  homepage "https://github.com/apiplant/kr-rs"
  version "0.1.2"
  license "Apache-2.0"

  # The release archives are the binaries; no source build or bottles. kr is
  # Linux only (namespaces, cgroup v2, overlayfs).
  on_linux do
    on_intel do
      url "https://github.com/apiplant/kr-rs/releases/download/v0.1.2/kr-rs-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cfa820a05593ccf7b5f6b825bcbbd0150f8147001dfe0e7058991134fc1991bc"
    end
    on_arm do
      url "https://github.com/apiplant/kr-rs/releases/download/v0.1.2/kr-rs-v0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8bce674b4eb62f466002cdd59faddd298587c6b9ec7bb57e394e0e9b4d8267f9"
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
