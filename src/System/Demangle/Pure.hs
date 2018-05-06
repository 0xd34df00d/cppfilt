{-|
 Module      : System.Demangle.Pure
 Description : Functions for demangling C++ names pretending to be pure
 Stability   : experimental
 Portability : wherever gcc lives

 This module provides bindings to the platform C++ ABI demangling routines
 (where the platform is currently limited to gcc). Any string-like type
 implementing 'CStringRepresentable' can be used, though strict bytestrings are
 the most performant.

 This module provides the pure-ish functions which hide the intrinsic 'IO'
 nature of doing FFI calls behind 'unsafePerformIO'. Demangling is
 referentially transparent, though, so that should be fine.
 -}

module System.Demangle.Pure where

import System.IO.Unsafe

import qualified System.Demangle as D
import Data.CStringRepresentable

-- |Try to demangle a mangled C++ name.
demangle :: CStringRepresentable s => s -> Maybe s
demangle = unsafePerformIO . D.demangle
