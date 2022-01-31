class Move2kubeAT030Rc1 < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://move2kube.konveyor.io/"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.3.0-rc.1",
      revision: "07955282cf2b027568ae8617f040f83c54742647"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/v0.3.0-rc.1"
    sha256 cellar: :any_skip_relocation, big_sur:      "134ecadda11046346c198068c983c5f471da4cf9f59a73508829d3244cc14c79"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "eb9d5a83ccab9004198ef4c5eb76d8b421b8e6521829d8c701f390368f0d67da"
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
