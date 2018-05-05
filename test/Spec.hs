{-# LANGUAGE OverloadedStrings #-}

import Test.Hspec

import qualified Data.ByteString.Char8 as BS

import qualified System.Demangle as D
import qualified System.Demangle.Pure as DP

import Data.CStringRepresentable

ioDemangledIs :: (Eq a, Show a, CStringRepresentable a) => a -> a -> IO ()
ioDemangledIs mangled ref = do
  res <- D.demangle mangled
  res `shouldBe` Just ref

pureDemangledIs :: (Eq a, Show a, CStringRepresentable a) => a -> a -> IO ()
pureDemangledIs mangled ref = DP.demangle mangled `shouldBe` Just ref

main :: IO ()
main = hspec $ do
  describe "Strings" $ do
    describe "IO demangle" $ do
      it "demangles some operators" $ do
        "_ZrsR11QDataStreamR5QUuid" `ioDemangledIs` ("operator>>(QDataStream&, QUuid&)" :: String)
    describe "pure demangle" $ do
      it "demangles some operators" $ do
        "_ZrsR11QDataStreamR5QUuid" `pureDemangledIs` ("operator>>(QDataStream&, QUuid&)" :: String)
  describe "ByteStrings" $ do
    describe "IO demangle" $ do
      it "demangles some operators" $ do
        "_ZrsR11QDataStreamR5QUuid" `ioDemangledIs` ("operator>>(QDataStream&, QUuid&)" :: String)
    describe "pure demangle" $ do
      it "demangles some operators" $ do
        "_ZrsR11QDataStreamR5QUuid" `pureDemangledIs` ("operator>>(QDataStream&, QUuid&)" :: String)
