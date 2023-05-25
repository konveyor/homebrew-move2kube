class Move2kubeAT037 < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://move2kube.konveyor.io/"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.3.7",
      revision: "59004ca1a68301095e4163253e1540305ead6ff8"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/v0.3.7"
    sha256 cellar: :any_skip_relocation, monterey:     "4ee2ad78e278abba42c149e45f902a1726335aa38d2d2e3a6bcef045d3ddbf2b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d81386666884ce454cc101a88060b99650b3b246737a5da881d966f241e0c10a"
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
