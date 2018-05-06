{-# LANGUAGE ForeignFunctionInterface #-}

{-|
 Module      : System.Demangle
 Description : Functions for demangling C++ names
 Stability   : experimental
 Portability : wherever gcc lives

 This module provides bindings to the platform C++ ABI demangling routines
 (where the platform is currently limited to gcc). Any string-like type
 implementing 'CStringRepresentable' can be used, though strict bytestrings are
 the most performant.

 This module provides the raw 'IO'-living functions. Thin wrappers pretending
 to be pure live in the "System.Demangle.Pure" module.
 -}

module System.Demangle(demangle) where

import qualified Data.ByteString.Char8 as BS
import Control.Exception

import Foreign.C
import Foreign.Marshal.Alloc
import Foreign.Ptr

import Data.CStringRepresentable

foreign import ccall "__cxa_demangle"
  cxa_demangle :: CString -> CString -> Ptr CSize -> Ptr CInt -> IO CString

-- |Try to demangle a mangled C++ name.
demangle :: CStringRepresentable a => a -> IO (Maybe a)
demangle str = toCString str $ \str' ->
  bracket
    (cxa_demangle str' nullPtr nullPtr nullPtr)
    free
    $ \res ->
      if res == nullPtr
        then pure Nothing
        else do
          res' <- fromCString res
          pure $ Just res'
