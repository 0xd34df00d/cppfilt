# cppfilt

This library provides bindings to the system ABI-exposed C++ name demangling
routines. It provides both `IO`-based API in the `System.Demangle` module
and the pure one in `System.Demangle.Pure`. The latter is deduced as unsafe
due to `unsafePerformIO` (which should be fine, though, since demangling is
hopefully referentially transparent).


## Supported systems

For now demangling is done using either `libstdc++` or `libc++` (controlled
via the `use-libcpp` build flag). Adding support for other ABIs in a similar
fashion should be easy.

