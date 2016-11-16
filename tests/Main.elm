port module Main exposing (..)

import Test.Runner.Node exposing (run, TestProgram)
import Json.Encode exposing (Value)

import SparseVectorTests


main : TestProgram
main =
    run emit SparseVectorTests.tests


port emit : ( String, Value ) -> Cmd msg
