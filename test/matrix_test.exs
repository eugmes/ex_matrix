defmodule MatrixTest do
  use ExUnit.Case
  import Matrix, only: [t: 1, add: 2, mul: 2]

  test "matrix transposition" do
    assert t([[1]])  == [[1]]
    assert t([[1, 2, 3]]) == [[1], [2], [3]]
    assert t([[1, 2, 3],
              [4, 5, 6]])
            ==
             [[1, 4],
              [2, 5],
              [3, 6]]
    assert t([[1, 2, 3],
              [4, 5, 6],
              [7, 8, 9]])
            ==
             [[1, 4, 7],
              [2, 5, 8],
              [3, 6, 9]]
  end

  test "matrix addtion" do
    assert add([[1]], [[2]]) == [[3]]
    assert add([[1, 2, 3],
                [4, 5, 6]],
               [[7, 8, 9],
                [10, 11, 12]])
              ==
               [[8, 10, 12],
                [14, 16, 18]]
  end

  test "matrix and scalar addition" do
    assert add([[1]], 10) == [[11]]
    assert add(10, [[1, 2, 3], [4, 5, 6]]) == [[11, 12, 13], [14, 15, 16]]
  end

  test "matrix multiplication" do
    assert  mul([[6,   7, 3,  4],
                 [-1, -2, 5, -3],
                 [0,   8, 9,  1]],
                [[2,   6, -4],
                 [3,   7,  5],
                 [0,   8,  9],
                 [10, 11, 12]])
               ==
                [[73,  153,  86],
                 [-38, -13,   3],
                 [34,  139, 133]]
  end
end
