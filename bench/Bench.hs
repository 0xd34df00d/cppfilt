import Criterion.Main

import qualified System.Demangle as D

main :: IO ()
main = defaultMain [
    bgroup "demangle string" [ bench "operator" $ nfIO $ D.demangle "_ZrsR11QDataStreamR5QUuid"
                             ]
  ]
