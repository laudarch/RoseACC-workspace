#!/bin/bash

TOP_WORKSPACE_DIR=`pwd`

export LD_LIBRARY_PATH=/media/ssd/boost/install/1_45_0:$LD_LIBRARY_PATH

./build

mkdir -p workspace

pushd workspace

$TOP_WORKSPACE_DIR/configure --prefix=$TOP_WORKSPACE_DIR --with-boost=/media/ssd/boost/install/1_45_0 --with-opencl=/usr --with-sqlite=/media/ssd/lib/sqlite

popd

make -C $TOP_WORKSPACE_DIR/workspace/rose/src -j8
make -C $TOP_WORKSPACE_DIR/workspace/rose/src install -j8

make -C $TOP_WORKSPACE_DIR/workspace/libOpenACC -j8

make -C $TOP_WORKSPACE_DIR/workspace/RoseACC -j8
make -C $TOP_WORKSPACE_DIR/workspace/examples -j8
make -C $TOP_WORKSPACE_DIR/workspace/tests -j8

