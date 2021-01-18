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
    |> calculate(0)
  end

  defp calculate([], acc), do: acc

  defp calculate([head | []], acc) do
    cond do
      head in @one -> acc + 1
      head in @four -> acc + 4
      head in @three -> acc + 3
      head in @two -> acc + 2
      head in @eight -> acc + 8
      head in @ten -> acc + 10
      head in @five -> acc + 5
    end
  end

  defp calculate([head | tail], acc) do
    cond do
      head in @one -> calculate(tail, acc + 1)
      head in @four -> calculate(tail, acc + 4)
      head in @three -> calculate(tail, acc + 3)
      head in @two -> calculate(tail, acc + 2)
      head in @eight -> calculate(tail, acc + 8)
      head in @ten -> calculate(tail, acc + 10)
      head in @five -> calculate(tail, acc + 5)
    end
  end

  defp get_char_list(string) do
    string
    |> String.codepoints()
    |> Enum.map(&String.upcase(&1))
    |> Enum.map(&String.trim(&1))
  end
end
