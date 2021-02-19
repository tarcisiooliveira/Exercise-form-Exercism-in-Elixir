defmodule Phone do
  @spec number(String.t()) :: String.t()
  def number(raw) do
    input = treatment(raw)

    cond do
      String.replace(input, ~r/[[:alpha:]]/, "") != input ->
        "0000000000"

      String.length(input) == 11 and !invalid_n_situation(input) and
          String.at(input, String.length(input) - 11) == "1" ->
        length = String.length(input)
        String.slice(input, 1..length)

      String.length(input) == 10 and !invalid_n_situation(input) ->
        input

      true ->
        "0000000000"
    end
  end

  @spec area_code(String.t()) :: String.t()
  def area_code(raw) do
    treatment(raw)
    |> valid_area_cod?()
  end

  defp valid_area_cod?(number) do
    length = String.length(number)

    cond do
      String.length(number) >= 10 ->
        if String.at(number, String.length(number) - 10) in ["0", "1"] do
          "000"
        else
          String.slice(number, (length - 10)..(length - 8))
        end

      true ->
        "000"
    end
  end

  defp invalid_n_situation(string) do
    if String.at(string, String.length(string) - 7) in ["0", "1"] or
         String.at(string, String.length(string) - 10) in ["0", "1"],
       do: true,
       else: false
  end

  @spec pretty(String.t()) :: String.t()
  def pretty(raw) do
    input = treatment(raw)

    cond do
      String.length(input) in 7..9 ->
        "(000) 000-0000"

      String.length(input) == 10 and !invalid_n_situation(input) ->
        insert_parameters(input)

      String.length(input) == 11 and !invalid_n_situation(input) ->
        String.slice(input, 1, String.length(input))
        |> insert_parameters()

      true ->
        "(000) 000-0000"
    end
  end

  defp insert_parameters(input) do
    to_charlist(input)
    |> List.insert_at(6, '-')
    |> List.insert_at(3, ') ')
    |> List.insert_at(0, '(')
    |> to_string
  end

  defp treatment(raw), do: String.replace(raw, ~r/[[:cntrl:]\)\(\s\-\+\.]/, "")
end
