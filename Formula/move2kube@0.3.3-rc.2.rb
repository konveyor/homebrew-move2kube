class Move2kubeAT033Rc2 < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://move2kube.konveyor.io/"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.3.3-rc.2",
      revision: "33251e9fe6623bcd0c71d18213503b9e591a1eb5"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/v0.3.3-rc.2"
    sha256 cellar: :any_skip_relocation, big_sur:      "cb7b49e5b1d45e6306ecd6bdb2c4d048ccaf1a16b198c2346860d5417a3a05c8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5e7399fb402e2ff09d564096611e42f24d43231bf6295cb829686b05372b2c12"
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
