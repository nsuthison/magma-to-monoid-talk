module CustomMonoid where

import Data.Semigroup (stimes, stimesIdempotentMonoid)
import GHC.Base (coerce)
import GHC.Generics


-- Monoid Sum
newtype Sum a = Sum {getSum :: a}
  deriving (Eq, Ord, Show)

instance Num a => Semigroup (Sum a) where
  (<>) = coerce ((+) :: a -> a -> a)

instance Num a => Monoid (Sum a) where
        mempty = Sum 0


-- Monoid Product
newtype Product a = Product { getProduct :: a }
  deriving (Eq, Ord, Show)

instance Num a => Semigroup (Product a) where
  (<>) = coerce ((*) :: a -> a -> a)

instance Num a => Monoid (Product a) where
  mempty = Product 1


-- Monoid All
newtype All = All { getAll :: Bool }
  deriving (Eq, Ord, Show)

instance Semigroup All where
        (<>) = coerce (&&)

instance Monoid All where
        mempty = All True


-- Monoid Any
newtype Any = Any {getAny :: Bool}
  deriving (Eq, Ord, Show)

instance Semigroup Any where
  (<>) = coerce (||)

instance Monoid Any where
  mempty = Any False