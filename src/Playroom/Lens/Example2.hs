{-# LANGUAGE TemplateHaskell #-}

module Playroom.Lens.Example2 where

import Control.Lens
import Control.Monad.State

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
  let initialPoint = Point 2 3
  let initialCircle = Circle initialPoint 5

  print initialCircle
  print $ act initialCircle

act :: Circle -> Circle
act circle = flip execState circle $ do
  right
  up
  scaleUp

right :: State Circle ()
right = modify (& (center . x) %~ (+ 1))

left :: State Circle ()
left = modify (& (center . x) %~ subtract 1)

up :: State Circle ()
up = modify (& (center . y) %~ (+ 1))

down :: State Circle ()
down = modify (& (center . y) %~ subtract 1)

scaleUp :: State Circle ()
scaleUp = modify (& radius %~ (+ 1))

scaleDown ::  State  Circle ()
scaleDown = modify (& radius %~ subtract 1)
