defmodule Scrabble do
  @one ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"]
  @four ["F", "H", "V", "W", "Y"]
  @three ["B", "C", "M", "P"]
  @two ["D", "G"]
  @eight ["J", "X"]
  @ten ["Q", "Z"]
  @five ["K"]

  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    word
    |> get_char_list
    |> calculate()
  end

  defp get_char_list(string) do
    string
    |> String.upcase()
    |> String.codepoints()
    |> Enum.map(&String.trim(&1))
    |> Enum.filter(&(&1 != ""))
  end

  defp calculate(word), do: Enum.reduce(word,0, &(&2+get_sum(&1)))

  defp get_sum(letter) do
    cond do
      letter in @one -> 1
      letter in @four -> 4
      letter in @three -> 3
      letter in @two -> 2
      letter in @eight -> 8
      letter in @ten -> 10
      letter in @five -> 5
    end
  end
end
