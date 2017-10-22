-- web/elm/Model.elm

module Model exposing (..)

import Routing exposing (Route)

type RemoteData e a
    = NotRequested
    | Requesting
    | Failure e
    | Success a

type alias Flags =
    { socketUrl : String }

type alias Model =
    { contactList : RemoteData String ContactList
    , contact : RemoteData String Contact
    , search : String
    , route : Route
    , flags : Flags
    }

type alias ContactList =
    { entries : List Contact
    , page_number : Int
    , total_entries : Int
    , total_pages : Int
    }

type alias Contact =
    { id : Int
    , first_name : String
    , last_name : String
    , gender : Int
    , birth_date : String
    , location : String
    , phone_number : String
    , email : String
    , headline : String
    , picture : String
    }

initialModel : Flags -> Route -> Model
initialModel flags route =
    { contactList = NotRequested
    , contact = NotRequested
    , search = ""
    , route = route
    , flags = flags
    }

initialContactList : ContactList
initialContactList =
    { entries = []
    , page_number = 1
    , total_entries = 0
    , total_pages = 0
    }

