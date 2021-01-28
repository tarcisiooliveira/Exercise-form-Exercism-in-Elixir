defmodule RomanNumerals do
  @roman_map %{
    1000 => "M",
    900 => "CM",
    500 => "D",
    400 => "CD",
    100 => "C",
    90 => "XC",
    50 => "L",
    40 => "XL",
    10 => "X",
    9 => "IX",
    5 => "V",
    4 => "IV",
    1 => "I"
  }

  def numeral(0), do: ""

  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    {key, value} = Enum.find(Enum.reverse(@roman_map), &(number >= elem(&1, 0)))
    value <> numeral(number - key)
  end
end
