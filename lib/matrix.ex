defmodule Matrix do
  @moduledoc """
  Contains functions for matrix operations. Matrices are represented
  as lists of rows, that itself are represented as lists.
  """

  @doc """
  Returns a transposed matrix.
  """
  def t([[] | _]) do
    []
  end

  def t(m) do
    [Enum.map(m, &hd/1) | t(Enum.map(m, &tl/1))]
  end

  @doc """
  Returns a new matrix, where each item is the result of invoking `fun` on each
  corresponding item of matrix.
  """
  def map(m, fun), do: Enum.map(m, &Enum.map(&1, fun))

  @doc """
  Returns a new matrix, where each item is the result of invoking `fun` on
  corresponding elements from each matrix.
  """
  def combine([], [], _), do: []

  def combine([h1 | t1], [h2 | t2], fun) do
    [Enum.zip(h1, h2) |> Enum.map(fn {e1, e2} -> fun.(e1, e2) end) | combine(t1, t2, fun)]
  end

  @doc """
  Matrix addition.
  """
  def add(x, m) when is_number(x) do
    map(m, &(x + &1))
  end

  def add(m, x) when is_number(x) do
    map(m, &(&1 + x))
  end

  def add(m1, m2), do: combine(m1, m2, &(&1 + &2))

  @doc """
  Matrix subtraction.
  """
  def sub(x, m) when is_number(x) do
    map(m, &(x - &1))
  end

  def sub(m, x) when is_number(x) do
    map(m, &(&1 - x))
  end

  def sub(m1, m2), do: combine(m1, m2, &(&1 - &2))

  @doc """
  Matrix multiplication
  """
  def mul(x, m) when is_number(x) do
    map(m, &(x * &1))
  end

  def mul(m, x) when is_number(x) do
    map(m, &(&1 * x))
  end

  def mul(m1, m2) do
    tm2 = t(m2)
    for row1 <- m1 do
      for col2 <- tm2 do
        Enum.zip(row1, col2)
         |> Enum.map(fn {e1, e2} -> e1 * e2 end)
         |> Enum.reduce(0, &(&1 + &2))
      end
    end
  end
end
