#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.68])
AC_INIT([RoseACC-workspace], [0.1], [vanderbruggentristan@gmail.com])

AM_INIT_AUTOMAKE([RoseACC-workspace], [0.1])

LT_INIT()

# Checks for programs.

# Checks for libraries.

AC_ARG_WITH(opencl,        [  --with-opencl            OpenCL path])
AC_ARG_WITH(opencl-libdir, [  --with-opencl-libdir     OpenCL libraries path])

if test ! -z "$with_opencl"
then
  AC_MSG_NOTICE([OpenCL path provided])
  AC_SUBST(opencl_path, "$with_opencl")
  AC_SUBST(opencl_lib_path, "$with_opencl/lib")
else
  AC_MSG_ERROR([Missing OpenCL headers and/or libraries paths.])
fi
if test ! -z "$with_opencl_libdir"
then
	AC_MSG_NOTICE([OpenCL libraries path provided])
        AC_SUBST(opencl_lib_path, $with_opencl_libdir)
fi
# TODO test OpenCL

AC_ARG_WITH(sqlite,        [  --with-sqlite            SQLite path])
AC_ARG_WITH(sqlite-libdir, [  --with-sqlite-libdir     SQLite libraries path])

if test ! -z "$with_sqlite"
then
	AC_MSG_NOTICE([SQLite path provided])
        AC_SUBST(sqlite_path, "$with_sqlite")
        AC_SUBST(sqlite_lib_path, "$with_sqlite/lib")
else
  AC_MSG_ERROR([Missing SQLite headers and/or libraries paths.])
fi
if test ! -z "$with_sqlite_libdir"
then
	AC_MSG_NOTICE([SQLite libraries path provided])
        AC_SUBST(sqlite_lib_path, $with_sqlite_libdir)
fi
# TODO test SQLite

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
  AC_SUBST(boost_inc_path, $with_boost_inc)
fi
# TODO test BOOST

# Checks for header files.

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.

ac_configure_args="$ac_configure_args --with-libopenacc-src=$(cd $srcdir/libOpenACC; pwd) --with-libopenacc=`pwd`/install --with-rose=`pwd`/install --with-roseacc=`pwd`/install --with-C_OPTIMIZE=-O0 --with-CXX_OPTIMIZE=-O0 --disable-java --disable-fortran"

AC_CONFIG_SUBDIRS([libOpenACC
                   RoseACC
                   examples
                   tests
                   rose])

AC_CONFIG_FILES([Makefile])

AC_OUTPUT

