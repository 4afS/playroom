module Playroom.Vector.Unboxed.Example1 where

import qualified Data.Vector.Unboxed as UV

main = do
  let uv1 = UV.fromList [1..100] :: UV.Vector Int
  let uv2 = UV.fromList [1..10] :: UV.Vector Int
  print $ UV.last uv1
  print $ uv2 UV.// [(1, 20), (3, 2000)]
