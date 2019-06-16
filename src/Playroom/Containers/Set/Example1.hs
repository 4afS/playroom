module Playroom.Containers.Set.Example1 where

import           Data.Set                       ( Set )
import qualified Data.Set                      as Set

import           Data.IntSet                    ( IntSet )
import qualified Data.IntSet                   as IntSet

main = do
  let s1 = Set.fromList [1 .. 10]
  let s2 = Set.fromList [5 .. 15]
  print s1
  print $ Set.delete 5 s1
  print $ Set.member 3 s1
  print $ Set.null s1
  print $ Set.size s1
  print $ Set.lookupMax s1
  print $ Set.lookupMin s1
  print $ Set.insert 10000 s1
  print $ Set.filter (< 5) s1
  print $ s1 `Set.union` s2
  print $ s1 `Set.intersection` s2
  print $ s1 `Set.isSubsetOf` s2
