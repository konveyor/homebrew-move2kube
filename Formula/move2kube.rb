class Move2kube < Formula
  desc "Command-line tool that accelerates the process of re-platforming to Kubernetes/Openshift"
  homepage "https://konveyor.io/move2kube"
  url "https://github.com/konveyor/move2kube/archive/v0.1.0.tar.gz"
  sha256 "b323c6045f4a970198021a8a31ac9ad9b17920d0f7a38c7bf23dbf6ee1c29c76"
  license "Apache-2.0"

  depends_on "go@1.15" => :build
  depends_on "docker" => :optional
  depends_on "helm" => :optional
  depends_on "kubernetes-cli" => :optional
  depends_on "buildpacks/tap/pack" => :optional
  depends_on "operator-sdk" => :optional

  def install
    system "make", "build"
    bin.install "bin/move2kube"
  end

  test do
    want = "v0.1.0"
    assert_match want, shell_output("#{bin}/move2kube version")
  end
end
