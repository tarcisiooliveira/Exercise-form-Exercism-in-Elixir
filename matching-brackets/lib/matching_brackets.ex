defmodule MatchingBrackets do
  @open ["(", "{", "["]
  @close [")", "}", "]"]
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t()) :: boolean
  def check_brackets(""), do: true

  def check_brackets(str) do
    str
    |> String.codepoints()
    |> check([])
  end

  defp check([head | []], []), do: true

  defp check([head | []], open_list) do
    cond do
      head in @open && open_list == [] -> false
      head in @open && get_closer(head) == false -> false
      true -> remove(head, open_list)
    end
  end

  defp check([head | tail] = lista, list) do
    cond do
      head in @open -> check(tail, list ++ [head])
      head in @close -> remove(head, tail, list)
      true -> check(tail, list)
    end
  end

  defp remove(head, list), do: if(Enum.at(list, -1) == get_closer(head), do: true)

  defp remove(head, tail, list) do
    if(Enum.at(list, -1) == get_closer(head)) do
      check(tail, List.delete_at(list, -1))
    else
      false
    end
  end

  defp get_closer(char) do
    cond do
      char == ")" -> "("
      char == "]" -> "["
      char == "}" -> "{"
      true -> false
    end
  end
end
