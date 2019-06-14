module Playroom.Lens.LensIO where

type LensIO s t a b 
  = (a -> IO b) -> s -> IO t
-- type LensIO s t a b = LensLike s t a b
type LensIO' s a 
  = (a -> IO a) -> s -> IO s
-- type LensIO' s a = LensLike' s a

type LensLike f s t a b 
  = (a -> f b) -> s -> f t
type LensLike' f s a 
  = (a -> f a) -> s -> f s

type Getter s a 
  = (a -> IO a) -> s -> IO s

type Optical  p q f s t a b 
  = p a (f b) -> q s (f t)
type Optical' p q f s a 
  = p a (f a) -> q s (f s)

type Optic  p f s t a b 
  = p a (f b) -> p s (f t)
-- type Optic p f s t a b = Optical pp f s t a b
type Optic' p f s a 
  = p a (f a) -> p s (f s)

newtype Const a b = Const { getConst :: a }

type Getting r s a = (a -> Const r a) -> s -> Const r s
--
-- (^.) :: s -> Getting a s a -> a
-- (^.) = undefined
--
-- (^.') :: s -> Getting a s a -> a
-- (^.')  = undefined
--
-- (^.'') :: s -> Getting a s a -> a
-- (^.'')  = undefined
