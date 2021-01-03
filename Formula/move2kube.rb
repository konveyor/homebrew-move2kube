class Move2kube < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://konveyor.io/move2kube"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.1.0",
      revision: "0e9d69d02c16379c6492e2404080fa295cc08a5f"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/move2kube-0.1.0"
    cellar :any_skip_relocation
    sha256 "a0405340acbf46ff9e7e90f22524ef0341c2e73449028e67564b47cc3c1a2e8b" => :big_sur
    sha256 "66df3fc240bd93909f561ec0ba0770106676723f13a79786bd66cd6348b66af3" => :catalina
    sha256 "231b4c264047b1380c8ca659227216d9e74e88d732bffe5a48912499a3f09587" => :x86_64_linux
  end

  depends_on "go@1.15" => :build
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
    want = "v0.1.0"
    assert_match want, shell_output("#{bin}/move2kube version")
  end
end
