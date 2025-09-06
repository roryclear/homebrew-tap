class Clearcam < Formula
  desc "NVR with AI object detection."
  homepage "https://github.com/roryclear/clearcam"
  url "https://github.com/roryclear/clearcam/releases/download/0.1.1/clearcam-0.1.1-macos.zip"
  sha256 "054f0ceff09e8a41782ee629a63bb85287f7ab257ea3042653bee23b47451989"
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
