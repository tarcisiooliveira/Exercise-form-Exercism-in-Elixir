defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    factors
    |> Enum.map(fn x -> get_multiples(limit - 1, x) end)
    |> Enum.concat()
    |> Enum.uniq()
    |> Enum.reduce(fn x, acc -> x+acc end)
  end

  def get_multiples(limit, factor) do
    Enum.map(0..Integer.floor_div(limit, factor), fn x -> x * factor end)
  end
end
