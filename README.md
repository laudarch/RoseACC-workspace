RoseACC Workspace
=================

This workspace regroups all the pieces needed for RoseACC to compile OpenACC applications.
RoseACC produces OpenCL C kernels for the OpenACC application.
These kernels - and the data they use - are managed by libOpenACC an implementation of the OpenACC Runtime.

## Content

This workspace contains submodules:
 * _libOpenACC_: implementation of OpenACC Runtime based on OpenCL
 * _rose_:       open-source source-to-source compiler for C/C++/FORTRAN/... This submodule points to the version used for the latest work on RoseACC.
 * _RoseACC_:    the actual OpenACC Compiler
 * _examples_:   Current support of OpenACC. Extensions specific to RoseACC. Known issues...
 * _tests_:      libOpenACC and RoseACC tests

## Getting Started

See ./init.sh, this script is not generic (yet) and the path for BOOST, OpenCL, and SQLite3 have to be edited.
Also, "-j" option for make should have a larger value than 8 if your system permit (twice number of cores if enougth memory, ROSE compilation requires large amount of memory).

```shell
#!/bin/bash

set -e

TOP_WORKSPACE_DIR=`pwd`

export LD_LIBRARY_PATH=/media/ssd/boost/install/1_45_0/lib:$LD_LIBRARY_PATH

./build

mkdir -p workspace

pushd workspace

$TOP_WORKSPACE_DIR/configure --prefix=$TOP_WORKSPACE_DIR/workspace/install --with-boost=/media/ssd/boost/install/1_45_0 --with-opencl=/usr --with-sqlite=/media/ssd/lib/sqlite

popd

# Following 4 lines can be replaced by : make -C $TOP_WORKSPACE_DIR/workspace/rose/src install-core -j8 (it implies to build/install exampleTranslator and tutorials)
make -C $TOP_WORKSPACE_DIR/workspace/rose/src -j8
make -C $TOP_WORKSPACE_DIR/workspace/rose install-data-local
make -C $TOP_WORKSPACE_DIR/workspace/rose/src install -j8
cp $TOP_WORKSPACE_DIR/workspace/rose/rosePublicConfig.h $TOP_WORKSPACE_DIR/workspace/install/include

make -C $TOP_WORKSPACE_DIR/workspace/RoseACC -j8

make -C $TOP_WORKSPACE_DIR/workspace/libOpenACC -j8
make -C $TOP_WORKSPACE_DIR/workspace/examples -j8
make -C $TOP_WORKSPACE_DIR/workspace/tests -j8
```

