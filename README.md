RoseACC Workspace
=================

This workspace regroups all the pieces needed for RoseACC to compile OpenACC applications.
RoseACC produces OpenCL C kernels for the OpenACC application.
These kernels - and the data they use - are managed by libOpenACC an implementation of the OpenACC Runtime.

## Content

This workspace contains submodules:
 * [libOpenACC](https://github.com/tristanvdb/libOpenACC): implementation of OpenACC Runtime based on OpenCL
 * [ROSE Compiler](https://github.com/tristanvdb/rose-for-openacc-to-opencl-compiler): open-source source-to-source compiler for C/C++/FORTRAN/...
     * internal copy of ROSE Compiler
     * potentially out-of-sync with ROSE's master branch
     * access to this branch is reserved to collaborators
 * [RoseACC](https://github.com/tristanvdb/RoseACC): OpenACC Compiler
 * [tests](https://github.com/tristanvdb/RoseACC-tests/): libOpenACC and RoseACC tests

> [Presentation of RoseACC](https://github.com/tristanvdb/RoseACC-tests/blob/master/roseacc/README.md)

## Getting Started

### Checkout the workspace

RoseACC workspace is stored on GitHub.
Currently (07/2014), the workspace point to a private repository for ROSE Compiler.
Soon, our changes to ROSE Compiler will be distributed through the official ROSE repository on GitHub (supposedly 09/2014).
Meanwhile, access can be granted to our repository (e-mail: vanderbruggentristan@gmail.com).

```shell
git clone git@github.com:tristanvdb/RoseACC-workspace.git
cd RoseACC-workspace
git submodule init
git submodule update
```
The last command may fail on the *rose* submodule.
In this case, update the submodule individually: `git submodule update libOpenACC ; git submodule update RoseACC ; git submodule update tests`.

### Setup script

> The setup script won't work if you don't have ROSE submodule.

For bash user, we provide a script (setup.sh) that build, compile, and install ROSE Compiler, RoseACC, and libOpenACC.
It also run `make check` in the *tests* directory.

Usage: ./setup.sh build\_dir install\_dir boost\_home opencl\_inc opencl\_lib sqlite\_inc sqlite\_lib \[parallel\_make=8\]
 * build\_dir     : Build directory (created if needed)
 * install\_dir   : Installation directory ('prefix' for configuration)
 * boost\_home    : home for Boost
 * opencl\_inc    : include path for OpenCL
 * opencl\_lib    : library path for OpenCL
 * sqlite\_inc    : include path for SQLite
 * sqlite\_lib    : library path for SQLite
 * parallel\_make : (opt) number of parallel processes to use for make.

### Build \& Configure \& Make

Coming soon: how to setup the environment manually...
For now you can just figure out what happens with *setup.sh*.

NB: without all the submodules the top configure file will fail too...

