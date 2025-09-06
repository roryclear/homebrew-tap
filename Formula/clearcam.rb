class Clearcam < Formula
  desc "NVR with AI object detection."
  homepage "https://github.com/roryclear/clearcam"
  url "https://github.com/roryclear/clearcam/releases/download/0.1.1/clearcam-0.1.1-macos.zip"
  sha256 "cfe653452bbb04f717c01ed501183f78450a59724aab80fbfd238a3c9d3addc5"
  license "AGPL"
  depends_on "ffmpeg"

  def install
    libexec.install Dir["*"]
    (bin/"clearcam").write <<~EOS
      #!/bin/bash
      "#{libexec}/clearcam" "$@"
    EOS
    chmod 0755, bin/"clearcam"
  end

  test do
    system "#{bin}/clearcam", "--version"
  end
end
