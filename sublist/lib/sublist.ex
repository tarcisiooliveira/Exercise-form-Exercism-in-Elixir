defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """

  # def compare([], [nil]), do: :sublist
  # def compare([nil], []), do: :superlist

  def compare(a, b) do
    cond do
      a == b -> :equal
      sublist?(a, b) -> :sublist
      sublist?(b, a) -> :superlist
      true -> :unequal
    end
  end

  defp sublist?(_, []), do: false

  defp sublist?(a, b), do: if(List.starts_with?(b, a), do: true, else: sublist?(a, tl(b)))
end
