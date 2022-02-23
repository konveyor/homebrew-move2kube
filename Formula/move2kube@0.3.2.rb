class Move2kubeAT032 < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://move2kube.konveyor.io/"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.3.2",
      revision: "ef9f59dcf5c90aab70450b3a092dd5cad2832018"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/v0.3.2"
    sha256 cellar: :any_skip_relocation, big_sur:      "a07d1d76e890e2fdc363f15b617a82947a7a7ceae1ce5c2a8f643848ac595927"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4f7279be5ae6328a5fbc9ab354c2c77e786c91626d8e5ac4eddecf265d430056"
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
