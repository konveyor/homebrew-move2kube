class Move2kubeAT036 < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://move2kube.konveyor.io/"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.3.6",
      revision: "6aee6e37fdb268e5cf0f25f35ffeba00291cc725"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/v0.3.6"
    sha256 cellar: :any_skip_relocation, monterey:     "57ff93791d10657e8a28107a16c15903b5973a1229c6b3a5518aa664164ba9f4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "17c07b0c58b0f464466b4a7825861cae6bddf38f0d85a191ac65d4b1d48dba90"
  end

  depends_on "go@1.18" => :build
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
    want = "v" + version
    assert_equal want, shell_output("#{bin}/move2kube version").strip
  end
end
