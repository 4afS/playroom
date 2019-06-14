module Playroom.Vector.Boxed.Example1 (main) where

import Data.Vector (Vector(..))
import Data.Vector as V
import Data.Maybe

main :: IO ()
main = do
  putStrLn "\nBoxed\n"
  let v = V.fromList [1..10] :: Vector Int
  let uv = V.fromList [] :: Vector Int
  print v
  print $ V.map (*2) v
  print $ v ! 5
  print $ v !? 5
  print $ V.slice 2 5 v
  print $ V.singleton 38
  print $ V.sequence $ V.filter isJust $ generate 5 (\n -> if even n then Just n else Nothing)
  print $ V.length v
  -- s <- V.map read . fromList . words <$> getLine :: IO (Vector Int)
  print $ V.last $ V.fromList [1..100000000]
