-- web/elm/Contact/View.elm

module Contact.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Model exposing (..)


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
            [ classes ]
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


