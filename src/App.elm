module App exposing (main)

{-| The main entry point for the app.

@docs main
-}

import Html
import State
import Types exposing (..)
import View


{-| Run the application.
-}
main : Program Never Model Msg
main =
    Html.program
        { init = State.init
        , update = State.update
        , subscriptions = State.subscriptions
        , view = View.root
        }
