#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.68])
AC_INIT([RoseACC-workspace], [0.1], [vanderbruggentristan@gmail.com])

AM_INIT_AUTOMAKE([RoseACC-workspace], [0.1])

LT_INIT()

#####
# Boost (needed by ROSE)
#####

AC_ARG_WITH(boost,         [  --with-boost             BOOST path])
AC_ARG_WITH(boost-libdir,  [  --with-boost-libdir      BOOST libraries path])

if test ! -z "$with_boost"
then
  AC_MSG_NOTICE([BOOST path provided])
  AC_SUBST(boost_path, "$with_boost")
  AC_SUBST(boost_lib_path, "$with_boost/lib")
else
  AC_MSG_ERROR([Need BOOST path for ROSE])
fi
if test ! -z "$with_boost_libdir"
then
  AC_MSG_NOTICE([BOOST headers path provided])
  AC_SUBST(boost_lib_path, $with_boost_libdir)
fi
# TODO test BOOST

#####
# OpenCL
#####

AC_ARG_WITH(opencl-include, [  --with-opencl-include    OpenCL include path])
AC_ARG_WITH(opencl-libdir,  [  --with-opencl-libdir     OpenCL library path])

if test ! -z "$with_opencl_include"
then
	AC_MSG_NOTICE([OpenCL include path provided])
        AC_SUBST(opencl_inc_path, $with_opencl_include)
else
  AC_MSG_ERROR([Missing OpenCL include path.])
fi
if test ! -z "$with_opencl_libdir"
then
	AC_MSG_NOTICE([OpenCL library path provided])
        AC_SUBST(opencl_lib_path, $with_opencl_libdir)
else
  AC_MSG_ERROR([Missing OpenCL library path.])
fi
# TODO test OpenCL

#####
# SQLite
#####

AC_ARG_WITH(sqlite-include, [  --with-sqlite-include    SQLite include path])
AC_ARG_WITH(sqlite-libdir,  [  --with-sqlite-libdir     SQLite library path])

if test ! -z "$with_sqlite_include"
then
	AC_MSG_NOTICE([SQLite include path provided])
        AC_SUBST(sqlite_inc_path, $with_sqlite_include)
else
  AC_MSG_ERROR([Missing SQLite include path.])
fi
if test ! -z "$with_sqlite_libdir"
then
	AC_MSG_NOTICE([SQLite library path provided])
        AC_SUBST(sqlite_lib_path, $with_sqlite_libdir)
else
  AC_MSG_ERROR([Missing SQLite library path.])
fi
# TODO test SQLite

ac_configure_args="$ac_configure_args --with-openacc-include=$prefix/include --with-openacc-libdir=$prefix/lib --with-openacc-binary=$prefix/bin --with-rose=$prefix --with-roseacc=$prefix --with-C_OPTIMIZE=-O0 --with-CXX_OPTIMIZE=-O0 --disable-java --disable-fortran"

AC_CONFIG_SUBDIRS([libOpenACC
                   RoseACC
                   tests
                   rose])

AC_CONFIG_FILES([Makefile])

AC_OUTPUT

