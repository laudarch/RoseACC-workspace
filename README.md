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
 * _tests_:      libOpenACC and RoseACC tests

## Getting Started

### Checkout the workspace

RoseACC workspace is stored on GitHub.
Currently (mid June 2014), the workspace point to a repository for ROSE Compiler which is not public.
Soon, our changes to ROSE Compiler will be distributed through the official ROSE repository on GitHub.
Meanwhile, access can be granted to our repository (e-mail: vanderbruggentristan@gmail.com).

```shell
git clone git@github.com:tristanvdb/RoseACC-workspace.git
cd RoseACC-workspace
git submodule init
git submodule update
```

### Setup script

For bash user, we provide a script (setup.sh) that build, compile, and install ROSE Compiler

Usage: ./setup.sh build\_dir install\_dir boost\_home opencl\_home sqlite\_home \[parallel\_make=8\]
 * build\_dir     : Build directory (created if needed)
 * install\_dir   : Installation directory ('prefix' for configuration)
 * boost\_home    : home for Boost
 * opencl\_home   : home for OpenCL
 * sqlite\_home   : home for SQLite
 * parallel\_make : (opt) number of parallel processes to use for make.

### Build \& Configure \& Make

See 'setup.sh'.

