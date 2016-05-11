module SparseVectorTests exposing (..)

import ElmTest exposing (..)

import SparseVector


tests : Test
tests =
    suite "SparseVector tests"
      [ magnitude1 ()
      , dotProduct1 ()
      , cosineSimilarity1 ()
      ]


magnitude1 _ =
    let
      vec = SparseVector.insertList [(0, 4), (1, 5), (2, 6)] SparseVector.empty
    in
      test "calculating the magnitude of a vector"
        <| assertEqual (sqrt 77) (SparseVector.magnitude vec)


dotProduct1 _ =
    let
      vec1 = SparseVector.insertList [(0, 1), (1, 3), (2, -5)] SparseVector.empty
      vec2 = SparseVector.insertList [(0, 4), (1, -2), (2, -1)] SparseVector.empty
    in
      test "calculating he dot product with another vector"
        <| assertEqual 3 (SparseVector.dot vec1 vec2)


cosineSimilarity1 _ =
    let
      vec1 = SparseVector.insertList [(0, 1), (1, 3), (2, -5)] SparseVector.empty
      vec2 = SparseVector.insertList [(0, 4), (1, -2), (2, -1)] SparseVector.empty
    in
      test "calculating he dot product with another vector"
        <| assertEqual3Decimals 0.111 (SparseVector.cosineSimilarity vec1 vec2)


assertEqual3Decimals expect value =
    let scale3Dec float = round (float * 1000)
    in  assertEqual (scale3Dec expect) (scale3Dec value)