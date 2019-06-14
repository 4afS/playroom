{-# LANGUAGE TemplateHaskell #-}

module Playroom.Lens.Example1 where

import           Control.Lens

data Point
  = Point
    { _x :: Int
    , _y :: Int
    } deriving Show

data Circle
  = Circle
    { _center :: Point
    , _radius :: Double
    } deriving Show

makeLenses ''Point
makeLenses ''Circle

main = do
  let p = Point 2 3
  let c = Circle p 5

  print p
  print c

  print $ p ^. x
  print $ c ^. (center . y)

  print $ p & x .~ 10
  print $ c & (center . y) .~ 100
