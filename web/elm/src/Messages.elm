-- web/elm/Messages.elm

module Messages exposing (..)

import Navigation
import Routing exposing (Route)
import Json.Encode as JE


type Msg
    = FetchSuccess JE.Value
    | FetchError JE.Value
    | FetchContactSuccess JE.Value
    | FetchContactError JE.Value
    | Paginate Int
    | HandleSearchInput String
    | HandleFormSubmit
    | ResetSearch
    | UrlChange Navigation.Location
    | NavigateTo Route
