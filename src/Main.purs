module Main where

import Prelude

import Effect (Effect)
import Effect.Aff (Aff)

import Data.Const (Const)

import Halogen.Aff (awaitBody, runHalogenAff)
import Halogen.HTML as HH
import Halogen as H
import Halogen.VDom.Driver (runUI)

-- https://github.com/JordanMartinez/learn-halogen/blob/latestRelease/src/01-Static-HTML/02-Static-HTML.purs

type StaticHTML = H.ComponentHTML Unit () Aff

staticHtml :: StaticHTML
staticHtml =
  HH.div_
    [ HH.div_
      [ HH.span_
        [ HH.text "This is text in a span!" ]
      ]
    ]

staticComponent :: StaticHTML -> H.Component HH.HTML (Const Void) Unit Void Aff
staticComponent renderHtml =
  H.mkComponent
    { initialState: const unit
    , render: \_ -> renderHtml
    , eval: H.mkEval H.defaultEval
    }

main :: Effect Unit
main = runHalogenAff do
  body <- awaitBody
  runUI (staticComponent staticHtml) unit body
