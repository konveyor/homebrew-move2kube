class Move2kubeAT039 < Formula
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
    sha256 cellar: :any_skip_relocation, monterey:     "17bc39756dbd426a4706930d32cd5cfcf272e5c6ab4228965622e1f639be0d2b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e8ffc627460030df1a10d9d77d56464b7772e96c4028e4edac62afa3869466df"
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
