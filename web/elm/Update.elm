-- web/elm/Update.elm

module Update exposing (..)

import Messages exposing (..)
import Commands exposing ( fetch )
import Model exposing (..)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        FetchResult (Ok response) ->
            { model | contactList = Success response } ! []

        FetchResult (Err error) ->
            { model | contactList = Failure "Something went wrong..." } ! []

        Paginate pageNumber ->
            model ! [ fetch pageNumber model.search ]

        HandleSearchInput value ->
            { model | search = value} ! []

        HandleFormSubmit ->
            { model | contactList = Requesting} ! [ fetch 1 model.search ]

