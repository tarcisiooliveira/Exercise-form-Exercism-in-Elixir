defmodule Isogram do
  # @alphabet ?a..?z,?s,?-
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t()) :: boolean
  def isogram?(sentence) do
    sentence
    |> String.codepoints()
    |> Enum.filter(&((&1!=" ")&&(&1!="-")))
    |> length()
    ==
      sentence
    |> String.codepoints()
    |> MapSet.new()
    |> MapSet.difference(MapSet.new([" ","-"]))
    |> MapSet.to_list()
    |> length()


  end
end
