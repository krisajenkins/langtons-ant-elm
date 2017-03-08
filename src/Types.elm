module Types exposing (..)

import Dict exposing (Dict)
import Time exposing (Time)


type Msg
    = Tick Time


type alias Position =
    ( Int, Int )


type Direction
    = North
    | East
    | South
    | West


type Color
    = Black
    | White


cycleColor : Color -> Color
cycleColor color =
    case color of
        Black ->
            White

        White ->
            Black


type alias World =
    Dict Position Color


type alias Ant =
    { position : Position
    , direction : Direction
    }


type alias Model =
    { world : World
    , ant : Ant
    }


turn : Color -> Direction -> Direction
turn color direction =
    case ( color, direction ) of
        ( Black, North ) ->
            East

        ( Black, East ) ->
            South

        ( Black, South ) ->
            West

        ( Black, West ) ->
            North

        ( White, North ) ->
            West

        ( White, West ) ->
            South

        ( White, South ) ->
            East

        ( White, East ) ->
            North


toDelta : Direction -> ( Int, Int )
toDelta direction =
    case direction of
        North ->
            ( 0, -1 )

        East ->
            ( 1, 0 )

        South ->
            ( 0, 1 )

        West ->
            ( -1, 0 )


addPositions : Position -> Position -> Position
addPositions ( x1, y1 ) ( x2, y2 ) =
    ( x1 + x2
    , y1 + y2
    )


moveAnt : Model -> Model
moveAnt ({ world, ant } as model) =
    let
        newAntPosition =
            addPositions ant.position (toDelta ant.direction)

        oldTileColor =
            Dict.get newAntPosition world
                |> Maybe.withDefault White

        newTileColor =
            cycleColor oldTileColor

        newAntDirection =
            turn newTileColor ant.direction

        newAnt =
            { ant
                | position = newAntPosition
                , direction = newAntDirection
            }

        newWorld =
            Dict.insert newAntPosition newTileColor world
    in
        { model
            | world = newWorld
            , ant = newAnt
        }
