defmodule RomanNumerals do

  @doc """
  Convert the number to a roman number.
   """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) when number > 0 and number <= 3000 do
    number
    |> Integer.digits()
    |> get_roman_number
  end

  defp get_roman_number(list) do
    reverse_list = Enum.reverse(list)

    for x <- (length(list) - 1)..0 do
      get_leter(x, Enum.at(reverse_list, x))
    end
    |> Enum.join("")
  end

  defp get_leter(index, number) when index == 3 do
    case number do
      0 -> ""
      1 -> "M"
      2 -> "MM"
      3 -> "MMM"
    end
  end

  defp get_leter(index, number) when index == 2 do
    case number do
      0 -> ""
      1 -> "C"
      2 -> "CC"
      3 -> "CCC"
      4 -> "CD"
      5 -> "D"
      6 -> "DC"
      7 -> "DCC"
      8 -> "DCCC"
      9 -> "CM"
    end
  end

  defp get_leter(index, number) when index == 1 do
    case number do
      0 -> ""
      1 -> "X"
      2 -> "XX"
      3 -> "XXX"
      4 -> "XL"
      5 -> "L"
      6 -> "LX"
      7 -> "LXX"
      8 -> "LXXX"
      9 -> "XC"
    end
  end

  defp get_leter(index, number) when index == 0 do
    case number do
      0 -> ""
      1 -> "I"
      2 -> "II"
      3 -> "III"
      4 -> "IV"
      5 -> "V"
      6 -> "VI"
      7 -> "VII"
      8 -> "VIII"
      9 -> "IX"
    end
  end
end
