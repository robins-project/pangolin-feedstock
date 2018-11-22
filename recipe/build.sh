#!/bin/bash

mkdir build
cd build

export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$PREFIX/lib/pkgconfig

export CFLAGS="$CFLAGS -D__STDC_FORMAT_MACROS=1 -idirafter /usr/include"
export CXXFLAGS="$CXXFLAGS -D__STDC_FORMAT_MACROS=1 -idirafter /usr/include"
export LDFLAGS="$LDFLAGS -L/usr/lib/x86_64-linux-gnu -L/usr/lib -fuse-ld=gold"

#cmake -G "Ninja" \
#      -DOpenGL_GL_PREFERENCE=GLVND                    \
cmake                                                 \
      -DCMAKE_INSTALL_PREFIX=$PREFIX                  \
      -DCMAKE_PREFIX_PATH=$PREFIX                     \
      -DCMAKE_BUILD_TYPE:STRING=Release               \
      -DBUILD_PANGOLIN_GUI:BOOL=ON                    \
      -DBUILD_PANGOLIN_V4L:BOOL=OFF                   \
      -DCMAKE_LIBRARY_ARCHITECTURE=x86_64-linux-gnu   \
      -DPYTHON_EXECUTABLE=${PYTHON}                   \
      ..

#ninja install
make install
