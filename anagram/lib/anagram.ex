defmodule Anagram do
  # like bogmir`s solution
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    Enum.filter(candidates, &is_anagram?(base, &1))
  end

  def is_anagram?(base, word) do
    cond do
      String.downcase(base) == String.downcase(word) -> false
      true -> letter_frequencies(base) == letter_frequencies(word)
    end
  end

  def letter_frequencies(word) do
    word
    |> String.downcase()
    |> String.graphemes()
    |> Enum.sort()
  end
end
