{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}

import Test.Hspec

import qualified Data.ByteString.Char8 as BS
import Data.String
import Control.Monad

import qualified System.Demangle as D
import qualified System.Demangle.Pure as DP

import Data.CStringRepresentable

ioDemangledIs :: (Eq a, Show a, CStringRepresentable a) => a -> Maybe a -> IO ()
ioDemangledIs mangled ref = do
  res <- D.demangle mangled
  res `shouldBe` ref

pureDemangledIs :: (Eq a, Show a, CStringRepresentable a) => a -> Maybe a -> IO ()
pureDemangledIs mangled ref = DP.demangle mangled `shouldBe` ref

testData :: IsString a => [(String, [(a, Maybe a)])]
testData = [
    ("demangles some operators", [
        ("_ZrsR11QDataStreamR5QUuid", Just "operator>>(QDataStream&, QUuid&)")
      ])
  ]

runTests :: IsString a => (a -> Maybe a -> IO ()) -> SpecWith ()
runTests func =
  forM_ testData $ \(str, pairs) ->
    it str $ forM_ pairs $ uncurry func

main :: IO ()
main = hspec $ do
  describe "Strings" $ do
    describe "IO demangle" $ runTests @String ioDemangledIs
    describe "Pure demangle" $ runTests @String pureDemangledIs
  describe "ByteStrings" $ do
    describe "IO demangle" $ runTests @BS.ByteString ioDemangledIs
    describe "Pure demangle" $ runTests @BS.ByteString pureDemangledIs
