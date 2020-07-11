module Text.Parsing.String.UUID
  ( lowercase
  , uppercase
  , any
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
lowercase :: forall a m. S.StringLike a => Monad m => ParserT a m String
lowercase = do
  v <- R.exact 8  $ H.lowercase
  _ <- hyphen
  w <- R.exact 4  $ H.lowercase
  _ <- hyphen
  x <- R.exact 4  $ H.lowercase
  _ <- hyphen
  y <- R.exact 4  $ H.lowercase
  _ <- hyphen
  z <- R.exact 12 $ H.lowercase
  pure $ F.intercalate delimiter [v,w,x,y,z]
  where
    hyphen    = S.char '-'
    delimiter = "-"

-- | Consumes a valid UUID string (xxxxxxxx-xxxx-Mxxx-Nxxx-xxxxxxxxxxxx), or fails otherwise.
-- | Does not validate UUID version `M` and UUID variant of `N`.
-- | Fails if the 5th group is followed by additional uppercase hexadecimal characters.
uppercase :: forall a m. S.StringLike a => Monad m => ParserT a m String
uppercase = do
  v <- R.exact 8  $ H.uppercase
  _ <- hyphen
  w <- R.exact 4  $ H.uppercase
  _ <- hyphen
  x <- R.exact 4  $ H.uppercase
  _ <- hyphen
  y <- R.exact 4  $ H.uppercase
  _ <- hyphen
  z <- R.exact 12 $ H.uppercase
  pure $ F.intercalate delimiter [v,w,x,y,z]
  where
    hyphen    = S.char '-'
    delimiter = "-"

-- | Consumes a valid UUID string (xxxxxxxx-xxxx-Mxxx-Nxxx-xxxxxxxxxxxx), or fails otherwise.
-- | Does not validate UUID version `M` and UUID variant of `N`.
-- | Fails if the 5th group is followed by additional hexadecimal characters.
any :: forall a m. S.StringLike a => Monad m => ParserT a m String
any = do
  v <- R.exact 8  $ H.any
  _ <- hyphen
  w <- R.exact 4  $ H.any
  _ <- hyphen
  x <- R.exact 4  $ H.any
  _ <- hyphen
  y <- R.exact 4  $ H.any
  _ <- hyphen
  z <- R.exact 12 $ H.any
  pure $ F.intercalate delimiter [v,w,x,y,z]
  where
    hyphen    = S.char '-'
    delimiter = "-"
