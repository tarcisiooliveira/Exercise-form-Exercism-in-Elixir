defmodule Bob do
  def hey(input) do
    input = String.replace(input, ~r/[\t\:\)\(\)\n\r ]/, "")

    cond do
      input == "" ->
        "Fine. Be that way!"

      String.match?(input, ~r/^\s/) == true ->
        "Fine. Be that way!"

      String.ends_with?(input, "?") and
        String.match?(input, ~r/\p{L}/) == true and
          input == String.upcase(input) ->
        "Calm down, I know what I'm doing!"

      String.match?(input, ~r/\p{L}/) == true and
      input == String.upcase(input) ->
        "Whoa, chill out!"

      String.ends_with?(input, "?") ->
        "Sure."

      true ->
        "Whatever."
    end
  end

  # defp contains_downcase(input), do: String.match?(input, ~r/[[:lower:]]/)

  # defp contains_digit(input),
  #   do: String.match?(input, ~r/["1","2","3","4","5",""6","7","8","9","0"]/)

  # defp contains_upcase(input), do: String.match?(input, ~r/[[:upper:]]/)
  # defp replace_digits(input), do: String.replace(input, ~r/[[:digit:]\t\:\)\(\)\n\r\! ]/, "")
end
