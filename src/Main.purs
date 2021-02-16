module Main where

import Prelude

import Effect (Effect)
import Effect.Console (log)

import Messages.Hello (hello)

main :: Effect Unit
main = do
  log hello
