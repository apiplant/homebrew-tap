# Generated from packaging/homebrew/kr-rs.rb in apiplant/kr-rs by the release
# workflow, which fills in the version and checksums and commits the result to
# apiplant/homebrew-tap as Formula/kr-rs.rb. Changes belong in the source
# repository: the next release overwrites this file.
class KrRs < Formula
  desc "Kubernetes in one static binary: no libc, no third-party crates"
  homepage "https://github.com/apiplant/kr-rs"
  version "0.3.1"
  license "Apache-2.0"

  # The release archives are the binaries; no source build or bottles. kr is
  # Linux only (namespaces, cgroup v2, overlayfs).
  on_linux do
    on_intel do
      url "https://github.com/apiplant/kr-rs/releases/download/v0.3.1/kr-rs-v0.3.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8658eef2297f2892340e382e72bcc79bf3895b7b5a7d292b9796a8c2637e34c6"
    end
    on_arm do
      url "https://github.com/apiplant/kr-rs/releases/download/v0.3.1/kr-rs-v0.3.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ee2c05c1e0912a754e568207275a04a21b73bdadcb5041099a09ee436d6126dd"
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
