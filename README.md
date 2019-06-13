# mull-conan-gtest

A simple test example using conan to fetch gtest, and mull to perform mutation testing over gtest.

```
docker build -t mutation-test .
docker run --rm --mount type=bind,source=%cd%,target=/tmp/home/mutate -it mutation-test /bin/bash 
```

```
cd ~/mutate/
./compile-build
mull-cxx -test-framework=GoogleTest -mutators=math_mul_mutator \
  -ld_search_path /lib/x86_64-linux-gnu/ \
  -ld_search_path /usr/lib/x86_64-linux-gnu/  \
  -ld_search_path /tmp/home/.conan/data/gtest/1.7.0/bincrafters/stable/package/603bb6c5eb7361e3abfe3ec641b98e2dbda37616/lib/  \
  ./build/bin/test-factorial
```
