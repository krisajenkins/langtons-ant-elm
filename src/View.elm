module View exposing (root)

import Dict
import Html exposing (Html)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Types exposing (..)


root : Model -> Html Msg
root model =
    svg
        [ width "100vw"
        , height "100vh"
        , viewBox "-100 -100 200 200"
        ]
        [ worldView model.world
        , antView model.ant
        ]


tileSize : Int
tileSize =
    10


worldView : World -> Svg msg
worldView world =
    g []
        (Dict.toList world
            |> List.map (uncurry tileView)
        )


toColorCode : Color -> String
toColorCode color =
    case color of
        Black ->
            "black"

        White ->
            "white"


tileView : Position -> Color -> Svg msg
tileView position color =
    rect
        [ x <| toString <| Tuple.first position * tileSize
        , y <| toString <| Tuple.second position * tileSize
        , width <| toString tileSize
        , height <| toString tileSize
        , fill (toColorCode color)
        ]
        []


antView : Ant -> Svg msg
antView ant =
    let
        radius =
            toFloat tileSize / 2
    in
        circle
            [ cx <| toString <| toFloat (Tuple.first ant.position * tileSize) + radius
            , cy <| toString <| toFloat (Tuple.second ant.position * tileSize) + radius
            , r <| toString radius
            , fill "red"
            ]
            []
