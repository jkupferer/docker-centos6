# About

Docker image that enables building [apitrace](https://github.com/apitrace/apitrace/) for CentOS 6 / RHEL 6.

# Instructions

## Download

You can either download the image by doing

    $ docker pull jrfonseca/centos6
    $ docker tag jrfonseca/centos6 centos6-gcc49

or build the image yourself by doing

    $ docker build -t centos6-gcc49 https://raw.githubusercontent.com/apitrace/docker-centos6/master/Dockerfile

or by cloning this repository and doing

    $ docker build -t centos6-gcc49 .

## Build

Then build apitrace as:

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

You can verify the symbols versions doing

    $ objdump -p build/wrappers/glxtrace.so
    $ objdump -p build/glretrace

There should be:

* no `glibc` symbol with version higher than `GLIBC_2.12`

* no `GLIBCXX_*`symbol whatsoever, given that `libstdc++`` is statically linked

See also https://gcc.gnu.org/onlinedocs/libstdc++/manual/abi.html
