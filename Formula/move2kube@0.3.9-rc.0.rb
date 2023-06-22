class Move2kubeAT039Rc0 < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://move2kube.konveyor.io/"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.3.9-rc.0",
      revision: "88bb4253f3a0ff90d1ed54f15e5d54acbb51424b"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/v0.3.9-rc.0"
    sha256 cellar: :any_skip_relocation, monterey:     "647be44aeeafde8893b4c624a6e7032cacfd09191c36ba3c49d7b54aa3deac0b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4ae03d1806b6b993231162a713653d4f89ab4918d5ca49be05695336fc0ea31b"
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
