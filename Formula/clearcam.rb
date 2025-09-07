class Clearcam < Formula
  desc "NVR with AI object detection."
  homepage "https://github.com/roryclear/clearcam"
  url "https://github.com/roryclear/clearcam/releases/download/0.1.1/clearcam-0.1.1-macos.zip"
  sha256 "5d30cc14c7893e223a855432f0d66c7082fc47db3bc6e01dff7e5a790d38ee04"
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
