defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    Enum.map([3, 5, 7], fn x -> remain(number, x) end)
    |> Enum.join()
    |> out_put(number)
  end

  defp remain(dividend, divisor) do
    case divisor do
      3 -> if rem(dividend, divisor) == 0, do: "Pling"
      5 -> if rem(dividend, divisor) == 0, do: "Plang"
      7 -> if rem(dividend, divisor) == 0, do: "Plong"
    end
  end

  defp out_put("", number), do: to_string(number)
  defp out_put(string, _), do: string
end
