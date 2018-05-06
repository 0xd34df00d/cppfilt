# cppfilt

[![Build Status](https://travis-ci.org/0xd34df00d/cppfilt.svg?branch=master)](https://travis-ci.org/0xd34df00d/cppfilt)

This library provides bindings to the system ABI-exposed C++ name demangling
routines. It provides both `IO`-based API in the `System.Demangle` module
and the pure one in `System.Demangle.Pure`. The latter is deduced as unsafe
due to `unsafePerformIO` (which should be fine, though, since demangling is
hopefully referentially transparent).


## Supported systems

For now demangling is done using either `libstdc++` or `libc++` (controlled
via the `use-libcpp` build flag). Adding support for other ABIs in a similar
fashion should be easy.

This approach is probably suboptimal, though, since one might want to try
different ABIs that might be available simultaneously (since even clang and
gcc mangle some names slightly differently), but it's not entirely obvious
what the API should be like in this case.
