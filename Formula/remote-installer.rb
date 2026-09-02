class RemoteInstaller < Formula
  desc "Share a signed iOS build over a temporary HTTPS tunnel"
  homepage "https://github.com/icodesign/remote-installer"
  version "0.1.2"
  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/icodesign/remote-installer/releases/download/v0.1.2/remote-installer-0.1.2-darwin-arm64.tar.gz"
    sha256 "2ba8cd0fb4d759b806379b2b1a52929e330682ab7aafd84d965f8d72239211c6"
  elsif Hardware::CPU.intel?
    url "https://github.com/icodesign/remote-installer/releases/download/v0.1.2/remote-installer-0.1.2-darwin-x86_64.tar.gz"
    sha256 "f87d6238cb431dc7fc1fbefe1f8630c347689c5fbc128db0a8cf9c25f2eba0ce"
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
