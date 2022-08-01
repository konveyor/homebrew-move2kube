class Move2kubeAT033 < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://move2kube.konveyor.io/"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.3.3",
      revision: "8899f92ecc4ac40a7176385ce1ca9e9812caf95e"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/v0.3.3"
    sha256 cellar: :any_skip_relocation, big_sur:      "96eb1f64c71cda5d5dc2d1191b2b22712c019da570e1380a3081ee0bf95e4b5d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e47273cf7085efda4a4793ffa024cbb9df70767be00fa96077cc337f45c9e535"
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
