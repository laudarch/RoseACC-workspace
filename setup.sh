#!/bin/bash

set -e

LOCAL_DIR=`pwd`

if [ $# -lt 5 ]; then
  echo "Usage: ./setup.sh build_dir install_dir boost_home opencl_home sqlite_home [parallel_make=8]"
  echo "       build_dir     : Build directory (created if needed)"
  echo "       install_dir   : Installation directory ('prefix' for configuration)"
  echo "       boost_home    : home for Boost"
  echo "       opencl_home   : home for OpenCL"
  echo "       sqlite_home   : home for SQLite"
  echo "       parallel_make : number of parallel processes to use for make."
  exit
fi

SOURCE_DIR="$( cd "$( dirname "$0" )" && pwd )"

BUILD_DIR=$1
INSTALL_DIR=$2

BOOST_HOME=$3
OPENCL_HOME=$4
SQLITE_HOME=$5

if expr "$6" : '-\?[0-9]\+$' >/dev/null
then
  MAKE_OPTIONS=-j$6
else
  MAKE_OPTIONS=-j8
fi

export LD_LIBRARY_PATH=$BOOST_HOME/lib:$INSTALL_DIR/lib:$LD_LIBRARY_PATH

cd $SOURCE_DIR

./build

mkdir -p $BUILD_DIR

cd $BUILD_DIR

$SOURCE_DIR/configure --prefix=$INSTALL_DIR --with-boost=$BOOST_HOME --with-opencl=$OPENCL_HOME --with-sqlite=$SQLITE_HOME

cd $LOCAL_DIR

make $MAKE_OPTIONS -C $BUILD_DIR/rose install-core

make $MAKE_OPTIONS -C $BUILD_DIR/RoseACC install

make $MAKE_OPTIONS -C $BUILD_DIR/libOpenACC install

make $MAKE_OPTIONS -C $BUILD_DIR/examples

make $MAKE_OPTIONS -C $BUILD_DIR/tests

echo "*********************************************************"
echo
echo "RoseACC workspace was succesfully setup. The ROSE Compiler, RoseACC, and libOpenACC have been compiled and install."
echo
echo "Please run 'make -C $BUILD_DIR/tests check' and 'make -C $BUILD_DIR/examples check' if there is a valid OpenCL platform on this machine."
echo
echo "You might want to add to you ~/.bashrc :"
echo "    export PATH=$INSTALL_DIR/bin:\$PATH"
echo "    export LD_LIBRARY_PATH=$INSTALL_DIR/lib:\$LD_LIBRARY_PATH"
echo
echo "*********************************************************"

