defmodule Bob do
  def hey(input) do
    input = String.trim(input)

    cond do
      input == "" ->
        "Fine. Be that way!"

      String.match?(input, ~r/^\s/) == true ->
        "Fine. Be that way!"

      String.ends_with?(input, "?") and
        String.downcase(input) != input and
          input == String.upcase(input) ->
        "Calm down, I know what I'm doing!"

      String.downcase(input) != input and
          input == String.upcase(input) ->
        "Whoa, chill out!"

      String.ends_with?(input, "?") ->
        "Sure."

      true ->
        "Whatever."
    end
  end
end
