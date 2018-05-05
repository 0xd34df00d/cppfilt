# cppfilt

This library provides bindings to the system ABI-exposed C++ name demangling
routines. It provides both `IO`-based API in the `System.Demangle` module
and the pure one in `System.Demangle.Pure`. The latter is deduced as unsafe
due to `unsafePerformIO` (which should be fine, though, since demangling is
hopefully referentially transparent).


## Supported systems

For now demangling is done using `libstdc++`, which limits the library to the
systems that use gcc.

Supporting LLVM's `libc++` should be easy and just a matter of linking to a
different C library, since they `libc++` and `libstdc++` use the same API
w.r.t. demangling.

Patches are welcome!
