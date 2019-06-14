module Playroom.Vector.Boxed.FloydWarshall where

import           Data.Vector                    ( Vector(..)
                                                , (!)
                                                )
import qualified Data.Vector                   as V
import           Data.List
import           Control.Monad

type Row = Int
type Column = Int
type Matrix a = Vector (Vector a)

main = do
  [n, m] <- map read . words <$> getLine
  ab     <- replicateM m $ map read . words <$> getLine
  let l = map (replicate 2) [1 .. n]
  mapM_ print
    $  V.map (V.length . V.filter (== 2))
    $  floydWarshall
    $  initialize n
    $  ab ++ flipL ab ++ l

flipL :: [[a]] -> [[a]]
flipL []            = []
flipL ([a, b] : as) = [b, a] : flipL as

initialize :: Int -> [[Int]] -> Matrix Int
initialize n l = initialize' l (toMatrix $ replicate n $ replicate n $ 10 ^ 9)
 where
  initialize' [] v = v
  initialize' ((i : j : _) : ls) v
    | i /= j    = initialize' ls $ updateMatrix (i - 1, j - 1) 1 v
    | otherwise = initialize' ls $ updateMatrix (i - 1, j - 1) 0 v

toMatrix :: [[a]] -> Matrix a
toMatrix = V.fromList . map V.fromList

updateMatrix :: (Row, Column) -> a -> Matrix a -> Matrix a
updateMatrix (i, j) a vs = V.accum (V.//) vs [(i, [(j, a)])]

floydWarshall :: Matrix Int -> Matrix Int
floydWarshall v =
  let
    lv = V.length v
    ns =
      [ (i, j, k) | i <- [0 .. lv - 1], j <- [0 .. lv - 1], k <- [0 .. lv - 1] ]
  in
    floydWarshall' ns v
 where
  floydWarshall' []               v = v
  floydWarshall' ((i, j, k) : ns) v = floydWarshall'
    ns
    (updateMatrix (i, j) (min (v ! i ! j) ((v ! i ! k) + (v ! k ! j))) v)
