if [ -d "build" ]; then rm -rf build; fi

mkdir build && cd build
conan install .. -s compiler=clang --build=missing -s compiler.version=8 -s compiler.libcxx=libstdc++11
cmake \
  -DCMAKE_CXX_FLAGS="-fembed-bitcode -g -O0" \
  -DCMAKE_BUILD_TYPE=Debug \
  -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..
cmake --build . 

# libstdc++.so.6 : /usr/lib/x86_64-linux-gnu
# mull-cxx -test-framework=GoogleTest -mutators=math_mul_mutator \
#   -ld_search_path /lib/x86_64-linux-gnu/ \
#   -ld_search_path /usr/lib/x86_64-linux-gnu/  \
#   -ld_search_path /tmp/home/.conan/data/gtest/1.7.0/bincrafters/stable/package/603bb6c5eb7361e3abfe3ec641b98e2dbda37616/lib/  \
#   ./build/bin/test-factorial