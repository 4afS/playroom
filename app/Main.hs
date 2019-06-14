module Main where

import qualified Playroom.Lens as Lens
import qualified Playroom.Vector.Boxed as VBoxed
import qualified Playroom.Vector.Unboxed as VUnboxed

main :: IO ()
main = do
  putStrLn "\nCompile...\n"

  VBoxed.main
  VUnboxed.main
