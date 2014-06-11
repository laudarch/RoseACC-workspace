#!/bin/bash

set -e

BOOST_HOME=/media/ssd/boost/install/1_45_0/
OPENCL_HOME=/usr
SQLITE_HOME=/media/ssd/lib/sqlite

WORKSPACE_DIR=`pwd`
BUILD_DIR=$WORKSPACE_DIR/workspace
INSTALL_DIR=$BUILD_DIR/install

MAKE_OPTIONS=-j8

export LD_LIBRARY_PATH=$BOOST_HOME/lib:$LD_LIBRARY_PATH

./build

mkdir -p $BUILD_DIR

cd $BUILD_DIR

$WORKSPACE_DIR/configure --prefix=$INSTALL_DIR --with-boost=$BOOST_HOME --with-opencl=$OPENCL_HOME --with-sqlite=$SQLITE_HOME

cd $WORKSPACE_DIR

# Following 4 lines can be replaced by : make -C $BUILD_DIR/rose/src install-core -j8 (it implies to build/install exampleTranslator and tutorials)
make $MAKE_OPTIONS -C $BUILD_DIR/rose/src
make $MAKE_OPTIONS -C $BUILD_DIR/rose install-data-local
make $MAKE_OPTIONS -C $BUILD_DIR/rose/src install
cp $BUILD_DIR/rose/rosePublicConfig.h $INSTALL_DIR/include

make $MAKE_OPTIONS -C $BUILD_DIR/RoseACC
make $MAKE_OPTIONS -C $BUILD_DIR/RoseACC install

make $MAKE_OPTIONS -C $BUILD_DIR/libOpenACC

make $MAKE_OPTIONS -C $BUILD_DIR/examples

make $MAKE_OPTIONS -C $BUILD_DIR/tests

