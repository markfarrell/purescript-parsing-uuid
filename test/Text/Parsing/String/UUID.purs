module Test.Text.Parsing.String.UUID
  ( main
  ) where

import Prelude

import Effect (Effect)

import Text.Parsing.String.UUID as UUID

import Text.Parsing.Expect as E

lowercase :: Effect Unit
lowercase = do
  _ <- failure ""
  _ <- failure "82fa951b"
  _ <- failure "82fa951bb"
  _ <- failure "82fa951b-b591"
  _ <- failure "82fa951b-b591-4ace"
  _ <- failure "82fa951b-b591-4ace-b473"
  _ <- failure "82fa951b-b591-4ace-b473-f2aacaed56f"
  _ <- success "82fa951b-b591-4ace-b473-f2aacaed56fd"
  _ <- failure "82fa951bb-b591-4ace-b473-f2aacaed56fd"
  _ <- failure "82fa951b-b591-4ace-b473-f2aacaed56fda"
  _ <- failure "82fa951b-b591-4ace-b473-f2aacaed56fdaa"
  _ <- output  "82fa951b-b591-4ace-b473-f2aacaed56fd" "82fa951b-b591-4ace-b473-f2aacaed56fd"
  _ <- output  "123e4567-e89b-12d3-a456-426614174000" "123e4567-e89b-12d3-a456-426614174000"
  pure unit
  where
    success = \check -> E.success check (UUID.lowercase)
    failure = \check -> E.failure check (UUID.lowercase)
    output  = \check expect -> E.output check expect (UUID.lowercase)

uppercase :: Effect Unit
uppercase = do
  _ <- failure ""
  _ <- failure "82FA951B"
  _ <- failure "82FA951BB"
  _ <- failure "82FA951B-B591"
  _ <- failure "82FA951B-B591-4ACE"
  _ <- failure "82FA951B-B591-4ACE-B473"
  _ <- failure "82FA951B-B591-4ACE-B473-F2AACAED56F"
  _ <- success "82FA951B-B591-4ACE-B473-F2AACAED56FD"
  _ <- failure "82FA951BB-B591-4ACE-B473-F2AACAED56FD"
  _ <- failure "82FA951B-B591-4ACE-B473-F2AACAED56FDA"
  _ <- failure "82FA951B-B591-4ACE-B473-F2AACAED56FDAA"
  _ <- output  "82FA951B-B591-4ACE-B473-F2AACAED56FD" "82FA951B-B591-4ACE-B473-F2AACAED56FD"
  _ <- output  "123E4567-E89B-12D3-A456-426614174000" "123E4567-E89B-12D3-A456-426614174000"
  pure unit
  where
    success = \check -> E.success check (UUID.uppercase)
    failure = \check -> E.failure check (UUID.uppercase)
    output  = \check expect -> E.output check expect (UUID.uppercase)

any :: Effect Unit
any = do
  _ <- failure ""
  _ <- failure "82Fa951b"
  _ <- failure "82Fa951BB"
  _ <- failure "82FA951b-B591"
  _ <- failure "82FA951B-B591-4ACe"
  _ <- failure "82FA951B-B591-4ACE-B473"
  _ <- failure "82FA951B-B591-4ACE-B473-F2AACAED56F"
  _ <- success "82FA951B-B591-4Ace-b473-F2AaCAed56FD"
  _ <- failure "82FA951BB-B591-4ACE-B473-F2AACAED56FD"
  _ <- failure "82FA951B-B591-4ACE-B473-F2AACAED56FDA"
  _ <- failure "82FA951B-B591-4ACe-B473-F2AACAED56FDAA"
  _ <- output  "82FA951b-b591-4ACE-B473-F2AACAED56FD" "82FA951b-b591-4ACE-B473-F2AACAED56FD"
  _ <- output  "123e4567-E89B-12D3-A456-426614174000" "123e4567-E89B-12D3-A456-426614174000"
  pure unit
  where
    success = \check -> E.success check (UUID.any)
    failure = \check -> E.failure check (UUID.any)
    output  = \check expect -> E.output check expect (UUID.any)

main :: Effect Unit
main = do
  _ <- lowercase
  _ <- uppercase
  _ <- any
  pure unit
