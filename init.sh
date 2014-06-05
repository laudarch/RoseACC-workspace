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
make -C $TOP_WORKSPACE_DIR/workspace/RoseACC install

make -C $TOP_WORKSPACE_DIR/workspace/libOpenACC -j8

make -C $TOP_WORKSPACE_DIR/workspace/examples -j8

make -C $TOP_WORKSPACE_DIR/workspace/tests -j8

