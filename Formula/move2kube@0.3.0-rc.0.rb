class Move2kubeAT030Rc0 < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://move2kube.konveyor.io/"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.3.0-rc.0",
      revision: "9fc11146ad52f98ba26c9588fe7323a325976e2d"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/v0.3.0-rc.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "602b90d3c097fe5b333cdb7cb6c1ba628fb97321adf85d2aeadf62cf036466cf"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3b25b224a28dd5b9c5c989f59547fb4c99ebd8aaf73f95f0712d81ac1626ac0b"
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
