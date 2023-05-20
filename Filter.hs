import CustomMonoid
import Data.Char (isDigit, isLower)
import Data.Foldable (fold)



isForbidden :: Char -> Bool
isForbidden a = isLower a || isDigit a



-- f :: (Char -> Bool) -> (Char -> Bool) -> Char -> Bool
-- Monoid! (mappend :: a -> a -> a)

isForbidden' :: Char -> Bool
isForbidden' = getAny . foldMap (Any .) predicates
    where predicates = [isDigit, isLower]
