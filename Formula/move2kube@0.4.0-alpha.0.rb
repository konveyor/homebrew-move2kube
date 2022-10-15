class Move2kubeAT040Alpha0 < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://move2kube.konveyor.io/"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.4.0-alpha.0",
      revision: "e58c21caabcd2cdb7dd0f7f0fcc1e6afc8a35986"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/v0.4.0-alpha.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "57571585c406543264277d51dbb023ae8881b604cb08e1bdd5460621ac8fa689"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b992295783e36de9918b6e8786ef31af321b43c31877ab543d32a3cf88eee408"
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
