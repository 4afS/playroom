module Playroom.Containers.Map.Example1 where

import           Data.Map.Strict                ( Map )
import qualified Data.Map.Strict               as Map
import           Data.Maybe                     ( isJust )

main = do
  let nums = Map.fromList [(1, "one"), (2, "two"), (3, "three")]
  print nums

  print $ Map.lookup 4 nums
  print $ Map.lookup 3 nums

  print $ Map.insert 4 "four" nums
  print $ Map.delete 2 nums
  print $ Map.toAscList nums
  print $ Map.toDescList nums

  let newNums = Map.fromList [(1, "one"), (2, "two"), (2, "three")]
  print newNums

  print (Map.empty :: Map Int Int)

  print $ Map.singleton 1 "one"

  print
    $ Map.fromListWith (+) [("a", 1), ("a", 1), ("a", 1), ("a", 1), ("a", 1)]

  print $ nums Map.!? 2

  print $ Map.lookupMax nums
  print $ Map.lookupMin nums

  let f key value = key == 2 || value == "one"
  print $ Map.filterWithKey f nums

  print $ Map.adjust (++ "2") 2 nums
  print $ Map.adjust (++ "2") 4 nums

  let alterNums = Map.fromList [(1, "one"), (3, "three")]

  print $ Map.alter g 3 alterNums
  print $ Map.alter g 4 alterNums

  print $ Map.map (++ "!") nums

g (Just v) = Nothing
g Nothing = Just "Nothing"
