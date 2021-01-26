defmodule RomanNumerals do
  @spec numeral(pos_integer) :: String.t()
  def numeral(n) when n in 1000..3000, do: "M#{numeral(n-1000)}"
  def numeral(n) when n in 900..999,   do: "CM#{numeral(n-900)}"
  def numeral(n) when n in 500..899,   do: "D#{numeral(n-500)}"
  def numeral(n) when n in 400..499,   do: "CD#{numeral(n-400)}"
  def numeral(n) when n in 100..399,   do: "C#{numeral(n-100)}"
  def numeral(n) when n in 90..99,     do: "XC#{numeral(n-90)}"
  def numeral(n) when n in 50..89,     do: "L#{numeral(n-50)}"
  def numeral(n) when n in 40.. 49,    do: "XL#{numeral(n-40)}"
  def numeral(n) when n in 10..39,     do: "X#{numeral(n-10)}"
  def numeral(9),                      do: "IX"
  def numeral(n) when n in 5..8,       do: "V#{numeral(n-5)}"
  def numeral(4),                      do: "IV"
  def numeral(n) when n in 1..3,       do: "#{numeral(n-1)}I"
  def numeral(0),                      do: ""

end
