class Move2kube < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://move2kube.konveyor.io/"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.3.9",
      revision: "516df6621dd838b86d7f37c0601011d15dba8cb2"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/v0.3.9"
    sha256 cellar: :any_skip_relocation, monterey:     "fd8a35a70663856d4423c71d9b7fd7badd93237e3108995e0a30377903dcdde8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5e172af880123d40e34942742359c06cbcf99a6a1a00c6cf029f0cb57c6338a0"
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
