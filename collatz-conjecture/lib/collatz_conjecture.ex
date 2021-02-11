defmodule CollatzConjecture do
  require Integer
  #thaks to chriseyre2000 Mentor
  #because Integer is a Macro and they are expanded at compile time.

  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  def calc(1), do: 0

  def calc(num) when is_integer(num) and Integer.is_even(num),
    do: calc(div(num, 2), 1)

  def calc(num) when is_integer(num),
    do: calc(3 * num + 1, 1)

  defp calc(1, acc), do: acc

  defp calc(num, acc) when num >= 2 and Integer.is_even(num),
    do: calc(div(num, 2), 1 + acc)

  defp calc(num, acc) when num >= 2,
    do: calc(3 * num + 1, 1 + acc)
end
