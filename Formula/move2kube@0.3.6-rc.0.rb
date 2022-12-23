class Move2kubeAT036Rc0 < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://move2kube.konveyor.io/"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.3.6-rc.0",
      revision: "3516ff76e2b39264dbdb0f732722980b244d28b4"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/v0.3.6-rc.0"
    sha256 cellar: :any_skip_relocation, monterey:     "d1458892f8fc08226997af2f1f41bb7d85e798afa0635f896cb04b743f2a2ed7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9e76cc35b5e23279f2d60c42a34e459d796064357b72f9378fa817f6aadc21f0"
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
