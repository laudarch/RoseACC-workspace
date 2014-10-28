#!/bin/bash

set -e

LOCAL_DIR=`pwd`

if [ $# -lt 7 ]; then
  echo "Usage: ./setup.sh build_dir install_dir boost_home opencl_inc opencl_lib sqlite_inc sqlite_lib [parallel_make=1]"
  echo "       build_dir     : Build directory (created if needed)"
  echo "       install_dir   : Installation directory ('prefix' for configuration)"
  echo "       boost_home    : home for Boost"
  echo "       opencl_inc    : inc path for OpenCL"
  echo "       opencl_lib    : lib path for OpenCL"
  echo "       sqlite_inc    : inc path for SQLite"
  echo "       sqlite_lib    : lib path for SQLite"
  echo "       parallel_make : number of parallel processes to use for make (default is 1)."
  exit
fi

SOURCE_DIR="$( cd "$( dirname "$0" )" && pwd )"

BUILD_DIR=$1
mkdir -p $BUILD_DIR
BUILD_DIR="$( cd $BUILD_DIR && pwd )"

INSTALL_DIR=$2
mkdir -p $INSTALL_DIR
INSTALL_DIR="$( cd $INSTALL_DIR && pwd )"

BOOST_HOME=$3
OPENCL_INC=$4
OPENCL_LIB=$5
SQLITE_INC=$6
SQLITE_LIB=$7

if expr "$8" : '-\?[0-9]\+$' >/dev/null
then
  MAKE_OPTIONS=-j$8
fi

cd $SOURCE_DIR

./build

mkdir -p $BUILD_DIR

cd $BUILD_DIR

$SOURCE_DIR/configure --prefix=$INSTALL_DIR --with-boost=$BOOST_HOME --with-opencl-include=$OPENCL_INC --with-opencl-libdir=$OPENCL_LIB --with-sqlite-include=$SQLITE_INC --with-sqlite-libdir=$SQLITE_LIB

cd $LOCAL_DIR

make $MAKE_OPTIONS -C $BUILD_DIR/rose install-core

make $MAKE_OPTIONS -C $BUILD_DIR/RoseACC install

make $MAKE_OPTIONS -C $BUILD_DIR/libOpenACC install

echo > $INSTALL_DIR/roseacc.rc
echo "export LD_LIBRARY_PATH=$INSTALL_DIR/lib:$LD_LIBRARY_PATH" >> $INSTALL_DIR/roseacc.rc
echo "export PATH=$INSTALL_DIR/bin:$PATH" >> $INSTALL_DIR/roseacc.rc

source $INSTALL_DIR/roseacc.rc

echo "*********************************************************"
echo
echo "RoseACC workspace was succesfully setup. The ROSE Compiler, RoseACC, and libOpenACC have been compiled and installed."
echo
echo "RoseACC environment can be loaded using $INSTALL_DIR/roseacc.rc"
echo
echo "*********************************************************"
echo
openacc -l
echo
echo "*********************************************************"

