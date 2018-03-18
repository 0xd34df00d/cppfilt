{-# LANGUAGE ForeignFunctionInterface #-}

module System.Demangle(demangle) where

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
