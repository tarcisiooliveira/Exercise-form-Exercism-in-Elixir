defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c) when (a <= 0 or b <= 0 or c <= 0), do: {:error, "all side lengths must be positive"}

  def kind(a, b, c) when ((a + b) >= c and (c + b) >= a), do: do_kind(a, b, c)
  def kind(_a,_b,_c), do: {:error, "side lengths violate triangle inequality"}

  defp do_kind(a, a, a) , do: {:ok, :equilateral}
  defp do_kind(_a, b, b) , do: {:ok, :isosceles}
  defp do_kind(a, _b, a), do: {:ok, :isosceles}
  defp do_kind(a, a, _c), do: {:ok, :isosceles}
  defp do_kind(_a, _b, _c), do: {:ok, :scalene}
end
