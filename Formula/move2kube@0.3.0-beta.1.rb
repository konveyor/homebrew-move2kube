class Move2kubeAT030Beta1 < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://konveyor.io/move2kube"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.3.0-beta.1",
      revision: "854fa06c9830642877b5a3fbaac1498217437f61"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/v0.3.0-beta.1"
    sha256 cellar: :any_skip_relocation, big_sur:      "b9e00c58c0e89fbad982526ec092efb86cdf50612f93dfaa5c15d6fcb1420180"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ce29585caec571fecbfd8a7bea26ee23fd3f65e5efc28d217d92656c229c4f79"
  end

  depends_on "go@1.17" => :build
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
