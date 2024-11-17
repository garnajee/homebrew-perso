class ShakaPackager < Formula
  desc "Packager for DASH and HLS streaming"
  homepage "https://github.com/shaka-project/shaka-packager"
  url "https://github.com/shaka-project/shaka-packager/archive/refs/tags/v3.4.0.tar.gz"
  sha256 "93d9614ce181ef42e596c65d75fec6c9152b7f3308d1cafcaed006e79a1aeb1a"
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
