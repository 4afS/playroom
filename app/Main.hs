module Main where

import qualified Playroom.Lens as Lens
import qualified Playroom.Vector.Boxed as VBoxed
import qualified Playroom.Vector.Unboxed as VUnboxed
import qualified Playroom.Array.Array as Array
import qualified Playroom.Array.STArray as STArray
import qualified Playroom.Array.IOArray as IOArray
import qualified Playroom.Containers.Set as Set
import qualified Playroom.Containers.Map as Map
import qualified Playroom.Containers.Sequence as Sequence 

main :: IO ()
main = do
  putStrLn "\nCompile...\n"

  Set.main
  Map.main
  Sequence.main
