class RemoteInstaller < Formula
  desc "Share signed iOS and Android builds over a temporary HTTPS tunnel"
  homepage "https://github.com/icodesign/remote-installer"
  version "0.5.0"
  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/icodesign/remote-installer/releases/download/v0.5.0/remote-installer-0.5.0-darwin-arm64.tar.gz"
    sha256 "cdb0f1643b3356f8529065ef7d6d0fc58bca5c0b51b8f8d6db5b6550f9ecec4d"
  elsif Hardware::CPU.intel?
    url "https://github.com/icodesign/remote-installer/releases/download/v0.5.0/remote-installer-0.5.0-darwin-x86_64.tar.gz"
    sha256 "aad3a06829bdbf607ed7cbd58483fed857e6c2aeee787175a71975f99b32974c"
  else
    odie "remote-installer only provides macOS arm64 and x86_64 binaries"
  end

  def install
    bin.install "remote-installer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/remote-installer --version")
  end
end
