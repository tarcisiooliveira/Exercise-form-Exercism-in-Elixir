defmodule Bob do
  def hey(input) do
    input = String.replace(input, ~r/[\t\:\)\(\)\n\r ]/, "")
    # |>IO.puts()
    # |> String.codepoints()
    # |> IO.inspect()

    cond do
      input == "" ->
        "Fine. Be that way!"

      String.ends_with?(input, "?") and
      String.match?(input, ~r/\p{L}/)==true and
      input == String.upcase(input) ->
        "Calm down, I know what I'm doing!"


        String.ends_with?(input,"?") and
        replace_digits(input)|>String.length()>1 and
        contains_downcase(input)==true
       ->
        IO.inspect("SAída -> #{input}")
        "Sure."

      replace_digits(input)
      |> contains_downcase()==false and
      contains_upcase(input)==true->
        "Whoa, chill out!"

      true ->
        "Whatever."
    end
  end

  defp contains_downcase(input), do: String.match?(input, ~r/[[:lower:]]/)

  defp contains_digit(input),
    do: String.match?(input, ~r/["1","2","3","4","5",""6","7","8","9","0"]/)

  defp contains_upcase(input), do: String.match?(input, ~r/[[:upper:]]/)
  defp replace_digits(input), do: String.replace(input, ~r/[[:digit:]\t\:\)\(\)\n\r\! ]/, "")

  # defp question(input) do
  #   if contains_downcase(input) doz
  #     "Calm down, I know what I'm doing!"
  #   else
  #     "Sure."
  #   end
  # end
end
