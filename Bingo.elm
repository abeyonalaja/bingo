module Bingo where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import String exposing (toUpper, repeat, trimRight)

import StartApp

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
       newEntry "Future-Proof" 100 1,
       newEntry "Rock-Star Ninja" 400 4
      ]
  }

-- UPDATE

type Action
  = NoOp
  | Sort
  | SortByPhrase
  | Delete Int

update action model =
  case action of
    NoOp ->
      model

    Sort ->
      { model | entries <- List.sortBy .points model.entries }

    SortByPhrase ->
      { model | entries <- List.sortBy .phrase model.entries }

    Delete id ->
      let
        remainingEntries =
          List.filter (\ entry -> entry.id /= id) model.entries
      in
        { model | entries <- remainingEntries }

-- VIEW

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


entryItem address entry =
  li [ ]
     [
      span [class "phrase"] [text entry.phrase],
      span [class "points"] [text (toString entry.points)],
      button
        [ class "delete", onClick address (Delete entry.id) ][ ]
     ]

entryList address entries =
  let
    entryItems = List.map (entryItem address) entries
  in
    ul [ ] entryItems

    
view address model =
  div [id "container"]
      [ pageHeader,
        entryList address model.entries,
        button
          [ class "sort", onClick address Sort ]
          [ text "Sort" ],
        pageFooter ]

      
main =
  -- initialModel
  -- |> update Sort
  -- |> view
  StartApp.start
    {
      model = initialModel,
      view = view,
      update = update
    }
