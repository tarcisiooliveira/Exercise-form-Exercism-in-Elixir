defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @number ~w(0 1 2 3 4 5 6 7 8 9)
  @spec encode(String.t()) :: String.t()
  def encode("") do
    ""
  end

  def encode(string) do
    String.graphemes(string)
    |> count()
  end

  defp count(list) do
    [head | tail] = list
    count("", head, 1, tail)
  end

  defp count(str_cod, letter, sum, []) do
    case sum == 1 do
      true -> str_cod <> letter
      false -> str_cod <> to_string(sum) <> letter
    end
  end

  defp count(str_cod, letter, sum, tail_list) do
    [head | tail] = tail_list

    if letter == head do
      count(str_cod, head, sum + 1, tail)
    else
      case sum == 1 do
        true -> count(str_cod <> letter, head, 1, tail)
        false -> count(str_cod <> to_string(sum) <> letter, head, 1, tail)
      end
    end
  end

  @spec decode(String.t()) :: String.t()
  def decode("") do
    ""
  end

  def decode(string) do
    String.graphemes(string)
    |> decode("", "")
  end

  defp decode([], result, _) do
    result
  end

  defp decode(list, result, acc) do
    [head | tail] = list

    if Enum.member?(@number, head) do
      decode(tail, result, acc <> head)
    else
      if acc == "" do
        decode(tail, result <> head, "")
      else
        resultado = String.duplicate(head, String.to_integer(acc))
        decode(tail, result <> resultado, "")
      end
    end
  end
end
