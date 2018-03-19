{-# LANGUAGE ForeignFunctionInterface #-}

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

demangle :: String -> IO (Maybe String)
demangle str = withCString str $ \str' -> do
  res <- cxa_demangle str' nullPtr nullPtr nullPtr
  if res == nullPtr
    then pure Nothing
    else do
      res' <- peekCString res
      free res
      pure $ Just res'

demangleBS :: BS.ByteString -> IO (Maybe BS.ByteString)
demangleBS = fmap (fmap BS.pack) . demangle . BS.unpack

demangleLBS :: LBS.ByteString -> IO (Maybe LBS.ByteString)
demangleLBS = fmap (fmap LBS.pack) . demangle . LBS.unpack
