class Move2kube < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://konveyor.io/move2kube"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.2.0",
      revision: "8a4e2b89f0908e08fa817467bf4cecfcb9649cc9"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/v0.2.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "981479c94aaa11eaa74e88ef9edc8f1cc9bd42c683cf23bf0dcbe72e4229cf64"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "aaca8161fd8d3c251a969028e4dcbc66f203ea99b0fceb913167ae70f0301851"
  end

  depends_on "go@1.16" => :build
  depends_on "buildpacks/tap/pack" => :optional
  depends_on "docker" => :optional
  depends_on "helm" => :optional
  depends_on "kubernetes-cli" => :optional
  depends_on "operator-sdk" => :optional

  def install
    system "make", "build"
    bin.install "bin/move2kube"
  end

  test do
    # test the version
    want = "v0.1.0"
    assert_match want, shell_output("#{bin}/move2kube version")
  end
end
