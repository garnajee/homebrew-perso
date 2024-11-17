class ShakaPackager < Formula
  desc "Packager for DASH and HLS streaming"
  homepage "https://github.com/shaka-project/shaka-packager"
  url "https://github.com/shaka-project/shaka-packager/archive/v3.4.0.tar.gz"
  sha256 "6b32b88a69f312dbfc5fdaf11f3ddbf35108f982e7305f9db324e8ea2b853f70"
  license "BSD 3 clause"

  depends_on "cmake" => :build
  depends_on "ninja" => :build

  def install
    mkdir "build" do
      system "cmake", "..", "-G", "Ninja", "-DCMAKE_BUILD_TYPE=Release", *std_cmake_args
      system "ninja"
      system "ninja", "install"
    end
  end

  test do
    assert_match "Shaka Packager version", shell_output("#{bin}/packager --version")
  end
end
