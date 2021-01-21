defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    factors
    |> Enum.map(fn x -> Enum.map(0..Integer.floor_div(limit-1, x), &(&1 * x)) end)
    |> Enum.concat()
    |> MapSet.new
    |> Enum.reduce(&(&1+&2))
  end
end
