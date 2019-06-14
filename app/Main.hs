module Main where

import qualified Playroom.Lens as Lens
import qualified Playroom.Vector.Boxed as VBoxed
import qualified Playroom.Vector.Unboxed as VUnboxed
import qualified Playroom.Array.Array as Array
import qualified Playroom.Array.STArray as STArray
import qualified Playroom.Array.IOArray as IOArray

main :: IO ()
main = do
  putStrLn "\nCompile...\n"

  Array.main
  IOArray.main
  STArray.main
