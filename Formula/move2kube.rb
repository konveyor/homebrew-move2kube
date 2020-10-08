class Move2Kube < Formula
  desc "A command-line tool that accelerates the process of re-platforming to Kubernetes/Openshift."
  homepage "https://github.com/konveyor/move2kube"
  url "https://github.com/konveyor/move2kube.git",
      tag:      "v0.1.0-alpha",
      revision: "d4590d5693a570adc5d9faaaaf9bbc977a013e1f"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

#  bottle do
#    cellar :any_skip_relocation
#    sha256 "" => :catalina
#    sha256 "" => :mojave
#    sha256 "" => :high_sierra
#  end

  depends_on "go" => :build

  def install
    system "make", "build"
    bin.install "bin/move2kube"

    #mkdir "man1" do
    #  system bin/"move2kube", "docs", "--type", "man"
    #  man1.install Dir["*"]
    #end

    #output = Utils.safe_popen_read({ "SHELL" => "bash" }, bin/"move2kube", "completion", "bash")
    #(bash_completion/"move2kube").write output

    #output = Utils.safe_popen_read({ "SHELL" => "zsh" }, bin/"move2kube", "completion", "zsh")
    #(zsh_completion/"_move2kube").write output
  end
end
