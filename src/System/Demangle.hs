{-# LANGUAGE ForeignFunctionInterface #-}

{-|
 Module      : System.Demangle
 Description : Functions for demangling C++ names
 Stability   : experimental
 Portability : wherever gcc lives

 This module provides bindings to the platform C++ ABI demangling routines
 (where the platform is currently limited to gcc), conveniently working with
 'String' and both lazy and strict 'ByteString's.

 This module provides the raw 'IO'-living functions. Thin wrappers pretending
 to be pure live in the "System.Demangle.Pure" module.
 -}

module System.Demangle(
    demangle,
    demangleBS,
    demangleLBS
  ) where

import qualified Data.ByteString.Char8 as BS
import qualified Data.ByteString.Lazy.Char8 as LBS

import Foreign.C
import Foreign.Marshal.Alloc
import Foreign.Ptr

foreign import ccall "__cxa_demangle"
  cxa_demangle :: CString -> CString -> Ptr CSize -> Ptr CInt -> IO CString

-- |Try to demangle a 'String' with a mangled C++ name.
demangle :: String -> IO (Maybe String)
demangle str = withCString str $ \str' -> do
  res <- cxa_demangle str' nullPtr nullPtr nullPtr
  if res == nullPtr
    then pure Nothing
    else do
      res' <- peekCString res
      free res
      pure $ Just res'

-- |Try to demangle a strict 'BS.ByteString' with a mangled C++ name.
demangleBS :: BS.ByteString -> IO (Maybe BS.ByteString)
demangleBS = fmap (fmap BS.pack) . demangle . BS.unpack

-- |Try to demangle a lazy 'LBS.ByteString' with a mangled C++ name.
demangleLBS :: LBS.ByteString -> IO (Maybe LBS.ByteString)
demangleLBS = fmap (fmap LBS.pack) . demangle . LBS.unpack
