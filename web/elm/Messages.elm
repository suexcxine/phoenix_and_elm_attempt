-- web/elm/Messages.elm

module Messages exposing (..)

import Http
import Model exposing (ContactList)


type Msg
    = FetchResult (Result Http.Error ContactList)
    | Paginate Int
    | HandleSearchInput String
    | HandleFormSubmit
    | ResetSearch
