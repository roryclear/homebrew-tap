# clearcam.rb
class Clearcam < Formula
  desc "NVR with AI object detection."
  homepage "https://github.com/roryclear/clearcam"
  url "https://github.com/roryclear/clearcam/releases/download/0.1.0/clearcam-0.1.0-macos.zip"
  sha256 "cfe653452bbb04f717c01ed501183f78450a59724aab80fbfd238a3c9d3addc5"
  license "AGPL"
  depends_on "ffmpeg"

  def install
    bin.install "clearcam/clearcam"
  end

  test do
    system "#{bin}/clearcam", "--version"
  end
end
