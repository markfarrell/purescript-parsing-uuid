module Test.Main
  ( main
  ) where

import Prelude

import Effect (Effect)

import Test.Text.Parsing.String.UUID as A

main :: Effect Unit
main = A.main
