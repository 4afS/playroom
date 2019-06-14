module Playroom.Vector.Boxed.UpdateMatrix where

import  Data.Vector (Vector(..))
import qualified Data.Vector as V

type Row = Int
type Column = Int
type Matrix a = Vector (Vector a)

main = do
  let l = [ [ 1,  2,  3,  4,  5]
          , [ 6,  7,  8,  9, 10]
          , [11, 12, 13, 14, 15]
          ] 
  let v = V.fromList $ map V.fromList l :: Matrix Int
  -- 0行0列を10に更新
  let updated = updateMatrix (0, 0) 10 v
  print updated

-- 2次元Vectorを更新する関数
updateMatrix :: (Row, Column) -> a -> Matrix a -> Matrix a
updateMatrix (i, j) a vs = V.accum (V.//) vs [(i, [(j, a)])]
