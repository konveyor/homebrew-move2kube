class Move2kubeAT0311Rc0 < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://move2kube.konveyor.io/"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.3.11-rc.0",
      revision: "9bc4e8b017e995ad6cab70f9f9e28a3508ad52d5"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/v0.3.11-rc.0"
    sha256 cellar: :any_skip_relocation, monterey:     "0d53db74dac36db8f46f6a4866b8dc657eb0734f28cea0a4c662e1a12c53fda8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5580fcdedae95b32c0bbef2e78a9110565beb7d529e679d55eb04c79867993dd"
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
