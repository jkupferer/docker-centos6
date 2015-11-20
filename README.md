# About

Docker image that enables building apitrace for CentOS 6 / RHEL 6.

# Instructions

    $ docker build -t centos6-gcc49 .
    $ cd /path/to/git/clone/of/apitrace
    $ docker run -i -t -v $PWD:$PWD -u `id -u` centos6-gcc-4.9 cmake \
        -H$PWD \
        -B$PWD/build \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DENABLE_STATIC_LIBGCC=ON \
        -DENABLE_STATIC_LIBSTDCXX=ON \
        -DENABLE_STATIC_EXE=ON \
        -DENABLE_GUI=OFF
    $ docker run -i -t -v $PWD:$PWD -u `id -u` centos6-gcc-4.9 cmake --build build -- -j`nproc`

