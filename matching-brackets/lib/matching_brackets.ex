defmodule MatchingBrackets do
  @open ["(", "{", "["]
  @close [")", "}", "]"]
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t()) :: boolean
  def check_brackets(str) do
    str
    |> String.replace(~r/[^\(\)\[\]\{\}]/, "")
    |> String.codepoints()
    |> check([])
  end

  defp check([], []), do: true
  defp check([_ | []], []), do: true
  defp check([head | []], opening_list) do
    cond do
      get_closer(head) == false -> false
      true -> if(Enum.at(opening_list, -1) == get_closer(head), do: true, else: false)
    end
  end
  defp check([head | tail], opening_list) do
    cond do
      head in @open -> check(tail, opening_list ++ [head])
      head in @close -> remove(head, tail, opening_list)
      true -> check(tail, opening_list)
    end
  end
  defp remove(head, tail, opening_list) do
    if(Enum.at(opening_list, -1) == get_closer(head),
      do: check(tail, List.delete_at(opening_list, -1))
    )
  end
  defp get_closer(char) do
    case char do
      ")" -> "("
      "]" -> "["
      "}" -> "{"
      _ -> false
    end
  end
end
