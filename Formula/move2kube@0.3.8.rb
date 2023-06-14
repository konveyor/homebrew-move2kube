class Move2kubeAT038 < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://move2kube.konveyor.io/"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.3.8",
      revision: "eba459f5536408329e0b5eeadd253c84dcee99b7"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/v0.3.8"
    sha256 cellar: :any_skip_relocation, monterey:     "6df8347172172f59ec0283cda99ef019a038fa346217652a1247f37a24aebe15"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2aba7425bedeefa6a0dc727b7ef90329aac36e3ce9aa5035666966630ca12f03"
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
