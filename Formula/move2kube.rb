class Move2kube < Formula
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
    sha256 cellar: :any_skip_relocation, monterey:     "8594305e6fd16ccd3ec965b064b3c3f9e7ecca07677b894ff493b82c98fc402e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f62cdfe6685ed5cec8e068b09b256b9a194926dc580ab8787d9083f924419b79"
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
