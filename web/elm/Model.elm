-- web/elm/Model.elm

module Model exposing (..)

type RemoteData e a
    = NotRequested
    | Requesting
    | Failure e
    | Success a

type alias Model =
    { contactList : RemoteData String ContactList
    , search: String
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

initialModel : Model
initialModel =
    { contactList = NotRequested
    , search = ""
    }

initialContactList : ContactList
initialContactList =
    { entries = []
    , page_number = 1
    , total_entries = 0
    , total_pages = 0
    }

