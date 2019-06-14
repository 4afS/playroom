-- {-# LANGUAGE TemplateHaskell #-}
module Playroom.Lens.Tuple where

import Control.Lens

main = do
  let t = (1, ('a', 'b', ("Hoge", "Piyo")), 2)
  print t
  print $ t ^. _2 . _3 . _1 . to length

  -- same
  print $ _2 . _3 . _1 .~ "hello" $ t
  print $ t & _2 . _3 . _1 .~ "hello"

  -- same
  print $ view _2 t
  print $ t ^. _2'

  -- same
  print $ set _2 "hello" t
  print $ t & _2' .~ "hello"
  
  print $ 
    (10, 20, 30) &~ do
      _1 .= 40
      _2 .= 50
      _3 .= 60
