-- web/elm/Contact/View.elm

module Contact.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Messages exposing (..)
import Model exposing (..)
import Routing exposing (..)
import Common.View exposing (..)

contactView : Contact -> (String, Html Msg)
contactView contact =
    let
        classes =
            classList
                [ ( "card", True )
                , ( "male", contact.gender == 0 )
                , ( "female", contact.gender == 1 )
                ]

        fullName =
            contact.first_name ++ " " ++ contact.last_name
    in
        ( toString contact.id
        , div
            [ classes
            , onClick <| NavigateTo <| ShowContactRoute contact.id
            ]
            [ div
                [ class "inner" ]
                [ header
                    []
                    [ div
                        [ class "avatar-wrapper" ]
                        [ img
                            [ class "avatar"
                            , src contact.picture
                            ]
                            []
                        ]
                    , div
                        [ class "info-wrapper" ]
                        [ h4
                            []
                            [ text fullName ]
                        , ul
                            [ class "meta" ]
                            [ li
                                []
                                [ i
                                    [ class "fa fa-map-marker" ]
                                    []
                                , text contact.location
                                ]
                            , li
                                []
                                [ i
                                    [ class "fa fa-birthday-cake" ]
                                    []
                                , text contact.birth_date
                                ]
                            ]
                        ]
                    ]
                , div
                    [ class "card-body" ]
                    [ div
                        [ class "headline" ]
                        [ p [] [ text contact.headline ] ]
                    , ul
                        [ class "contact-info" ]
                        [ li
                            []
                            [ i
                                [ class "fa fa-phone" ]
                                []
                            , text contact.phone_number
                            ]
                        , li
                            []
                            [ i
                                [ class "fa fa-envelope" ]
                                []
                            , text contact.email
                            ]
                        ]
                    ]
                ]
            ]
        )

showContactView : Model -> Html Msg
showContactView model =
    case model.contact of
        Success contact ->
            let
                classes =
                    classList
                        [ ( "person-detail", True )
                        , ( "male", contact.gender == 0 )
                        , ( "female", contact.gender == 1 )
                        ]

                ( _, content ) =
                    contactView contact
            in
                div
                    [ id "contacts_show" ]
                    [ header []
                        [ h3
                            []
                            [ text "Person detail" ]
                        ]
                    , backToHomeLink
                    , div
                        [ classes ]
                        [ content ]
                    ]

        Requesting ->
            warningMessage
                "fa fa-spin fa-cog fa-2x fa-fw"
                "Fetching contact"
                (text "")

        Failure error ->
            warningMessage
                "fa fa-meh-o fa-stack-2x"
                error
                backToHomeLink

        NotRequested ->
            text ""
