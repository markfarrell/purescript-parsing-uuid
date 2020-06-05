module Text.Parsing.String.UUID 
  ( any
  ) where

import Prelude

import Data.Foldable (intercalate) as F

import Text.Parsing.Parser (ParserT)
import Text.Parsing.Parser.String as S

import Text.Parsing.Char.Hexadecimal  as H
import Text.Parsing.String.Repetition as R

-- | Consumes a valid UUID string (xxxxxxxx-xxxx-Mxxx-Nxxx-xxxxxxxxxxxx), or fails otherwise.
-- | Does not validate UUID version `M` and UUID variant of `N`.
-- | Fails if the 5th group is followed by additional lowercase hexadecimal characters. 
any :: forall a m. S.StringLike a => Monad m => ParserT a m String
any = do
  v <- R.least 8  $ H.lowercase 
  _ <- hyphen
  w <- R.least 4  $ H.lowercase
  _ <- hyphen
  x <- R.least 4  $ H.lowercase
  _ <- hyphen
  y <- R.least 4  $ H.lowercase
  _ <- hyphen
  z <- R.exact 12 $ H.lowercase
  pure $ F.intercalate delimiter [v,w,x,y,z]
  where 
    hyphen    = S.char '-'
    delimiter = "-" 
