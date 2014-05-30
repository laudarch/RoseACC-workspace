RoseACC Workspace
=================

This workspace regroups all the pieces needed for RoseACC to compile OpenACC applications.
RoseACC produces OpenCL C kernels for the OpenACC application.
These kernels - and the data they use - are managed by libOpenACC an implementation of the OpenACC Runtime.

## Content

This workspace contains submodules:
 * libOpenACC: implementation of OpenACC Runtime based on OpenCL
 * rose:       open-source source-to-source compiler for C/C++/FORTRAN/... This submodule points to the version used for the latest work on RoseACC.
 * RoseACC:    the OpenACC Compiler. Does not have a submodule yet, need to be moved from in rose/projects/RoseACC/
 * examples:   Current support of OpenACC. Extensions specific to RoseACC. Known issues and inconvenience.
 * tests:      libOpenACC and RoseACC tests

## Build & Configure

The project uses GNU autotools, to initialize:
    ./build
Then to configure:
    ./configure OPTIONS
For a list of options:
    ./configure --help
To work, the configure script need to find headers and libraries for OpenCL and sqlite (sqlite will be made optional)

## Make

'make' executes:
    make -C libOpenACC
    make -C rose/src
    make -C RoseACC # make -C rose/projects/RoseACC
    make -C examples
    make -C tests

## Check

'make check' executes:
    make -C examples check
    make -C tests check

## Install

**Not Implemented Yet**

'make install' executes:
    make -C libOpenACC install
    make -C rose/src install
    make -C RoseACC install # make -C rose/projects/RoseACC install

'make install-check' executes:
    make -C examples install-check
    make -C tests install-check
    

## Distribution

**Not Implemented Yet**

    make dist
    make distcheck

