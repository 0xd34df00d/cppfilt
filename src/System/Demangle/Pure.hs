{-|
 Module      : System.Demangle.Pure
 Description : Functions for demangling C++ names pretending to be pure
 Stability   : experimental
 Portability : wherever gcc lives

 This module provides bindings to the platform C++ ABI demangling routines
 (where the platform is currently limited to gcc), conveniently working with
 'String' and both lazy and strict 'ByteString's.

 This module provides the pure-ish functions which hide the intrinsic 'IO'
 nature of doing FFI calls behind 'unsafePerformIO'. Demangling is
 referentially transparent, though, so that should be fine.
 -}

module System.Demangle.Pure where

import qualified Data.ByteString.Char8 as BS
import qualified Data.ByteString.Lazy.Char8 as LBS
import System.IO.Unsafe

import qualified System.Demangle as D

-- |Try to demangle a 'String' with a mangled C++ name.
demangle :: String -> Maybe String
demangle = unsafePerformIO . D.demangle

-- |Try to demangle a strict 'BS.ByteString' with a mangled C++ name.
demangleBS :: BS.ByteString -> Maybe BS.ByteString
demangleBS = unsafePerformIO . D.demangleBS

-- |Try to demangle a lazy 'LBS.ByteString' with a mangled C++ name.
demangleLBS :: LBS.ByteString -> Maybe LBS.ByteString
demangleLBS = unsafePerformIO . D.demangleLBS
