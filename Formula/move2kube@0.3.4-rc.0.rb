class Move2kubeAT034Rc0 < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://move2kube.konveyor.io/"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.3.4-rc.0",
      revision: "033f62a08eec51c59d3303f84317d79f0f49de6f"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/v0.3.4-rc.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "e5a7427b10b99944ad6db2f3dc9c6423912d1f4fff57c0a675a1a4587ca334c7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6fcc40372d0f0019ca5b74018d7a2c09c861490ed35f6caf2a8d21b536d7de14"
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
