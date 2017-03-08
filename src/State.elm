module State exposing (..)

import Dict exposing (Dict)
import Time exposing (millisecond)
import Types exposing (..)


init : ( Model, Cmd Msg )
init =
    ( { world = Dict.empty
      , ant =
            { position = ( 0, 0 )
            , direction = North
            }
      }
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Tick _ ->
            ( moveAnt model
            , Cmd.none
            )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Time.every (50 * millisecond) Tick
