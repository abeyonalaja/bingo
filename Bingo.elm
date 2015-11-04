module Bingo where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import String exposing (toUpper, repeat, trimRight)

title message times =
  message ++ " "
  |> toUpper
  |> repeat times
  |> trimRight
  |> text


pageHeader =
  h1 [id "logo", class "something"] [title "bingo" 4]


pageFooter =
  footer []
    [a [ href "https://pragmaticstudio.com"]
       [ text "The Pragmatuc Studio"]]


view =
  div [id "container"] [ pageHeader, pageFooter ]

main =
  view
