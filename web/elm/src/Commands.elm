-- web/elm/Commands.elm

module Commands exposing (..)

import Messages exposing (Msg(..))
import Phoenix exposing (..)
import Phoenix.Push as Push
import Json.Encode as JE

fetch : String -> Int -> String -> Cmd Msg
fetch socketUrl page search =
    let
        payload =
            JE.object
                [ ( "page", JE.int page )
                , ( "search", JE.string search )
                ]

        push =
            Push.init "contacts" "contacts:fetch"
                |> Push.withPayload payload
                |> Push.onOk FetchSuccess
                |> Push.onError FetchError
    in
        Phoenix.push socketUrl push


fetchContact : String -> Int -> Cmd Msg
fetchContact socketUrl id =
    let
        push =
            Push.init "contacts" ("contact:" ++ toString id)
                |> Push.onOk FetchContactSuccess
                |> Push.onError FetchContactError
    in
        Phoenix.push socketUrl push

