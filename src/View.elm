module View exposing (root)

import Html exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


root : Model -> Html Msg
root model =
    div []
        [ p []
            [ text ("Counter: " ++ toString model.counter) ]
        , button [ onClick Increment ]
            [ text "Increment" ]
        ]
