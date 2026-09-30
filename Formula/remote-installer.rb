class RemoteInstaller < Formula
  desc "Share signed iOS and Android builds over a temporary HTTPS tunnel"
  homepage "https://github.com/icodesign/remote-installer"
  version "0.7.0"
  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/icodesign/remote-installer/releases/download/v0.7.0/remote-installer-0.7.0-darwin-arm64.tar.gz"
    sha256 "16cd18a778b87cf5efa88f133522940e496bbf98b37b14a0aeef68ef82aebe33"
  elsif Hardware::CPU.intel?
    url "https://github.com/icodesign/remote-installer/releases/download/v0.7.0/remote-installer-0.7.0-darwin-x86_64.tar.gz"
    sha256 "cb84254f4db98f4b9af2663f5beef144a027b5b36fe2a24de13b7ae5d96e47bd"
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
