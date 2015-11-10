module Bingo where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import String exposing (toUpper, repeat, trimRight)

newEntry phrase points id =
  {
    phrase    = phrase,
    points    = points,
    wasSpoken = False,
    id        = id
  }

initialModel =
  {
    entries =
      [
       newEntry "Doing Agile" 200 2,
       newEntry "In the cloud" 300 3,
       newEntry "Future-Proof" 100 1
      ]
  }


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


entryItem entry =
  li [ ]
     [
      span [class "phrase"] [text entry.phrase],
      span [class "points"] [text (toString entry.points)]
     ]

entryList =
  ul [ ]
     [
      entryItem ( newEntry "Future-Proof" 100 1),
      entryItem ( newEntry "agile" 200 2)
     ]

    
view model =
  div [id "container"]
      [ pageHeader,
        entryList model.entries,
        pageFooter ]

      
main =
  view initalModel
