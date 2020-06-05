module Test.Text.Parsing.String.UUID
  ( main
  ) where

import Prelude

import Effect (Effect)

import Text.Parsing.String.UUID as UUID

import Text.Parsing.Expect as E

any :: Effect Unit
any = do
  _ <- failure ""
  _ <- failure "82fa951b"
  _ <- failure "82fa951b-b591"
  _ <- failure "82fa951b-b591-4ace"
  _ <- failure "82fa951b-b591-4ace-b473"
  _ <- failure "82fa951b-b591-4ace-b473-f2aacaed56f"
  _ <- success "82fa951b-b591-4ace-b473-f2aacaed56fd"
  _ <- failure "82fa951b-b591-4ace-b473-f2aacaed56fda"
  _ <- output  "82fa951b-b591-4ace-b473-f2aacaed56fd" "82fa951b-b591-4ace-b473-f2aacaed56fd"
  _ <- output  "123e4567-e89b-12d3-a456-426614174000" "123e4567-e89b-12d3-a456-426614174000"
  pure unit
  where
    success = \check -> E.success check (UUID.any)
    failure = \check -> E.failure check (UUID.any)
    output  = \check expect -> E.output check expect (UUID.any)

main :: Effect Unit
main = do
  _ <- any
  pure unit
