defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  # @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    String.split(text, "")
    |> Enum.map(fn x -> encripta(x, shift) end)
    |> Enum.join()
  end

  def encripta(char, shift) do
    alfabeto = %{
      "a" => 0,
      "b" => 1,
      "c" => 2,
      "d" => 3,
      "e" => 4,
      "f" => 5,
      "g" => 6,
      "h" => 7,
      "i" => 8,
      "j" => 9,
      "k" => 10,
      "l" => 11,
      "m" => 12,
      "n" => 13,
      "o" => 14,
      "p" => 15,
      "q" => 16,
      "r" => 17,
      "s" => 18,
      "t" => 19,
      "u" => 20,
      "v" => 21,
      "w" => 22,
      "x" => 23,
      "y" => 24,
      "z" => 25
    }

    lista = {
      "a",
      "b",
      "c",
      "d",
      "e",
      "f",
      "g",
      "h",
      "i",
      "j",
      "k",
      "l",
      "m",
      "n",
      "o",
      "p",
      "q",
      "r",
      "s",
      "t",
      "u",
      "v",
      "w",
      "x",
      "y",
      "z"
    }

    if char == String.downcase(char) do
      posicao = Map.get(alfabeto, char)

      case posicao do
        nil -> char
        _ -> elem(lista, rem(posicao + shift, 26))
      end
    else
      char = String.downcase(char)
      posicao = Map.get(alfabeto, char)

      case posicao do
        nil ->
          char

        _ ->
          elem(lista, rem(posicao + shift, 26))
          |> String.upcase()
      end
    end
  end
end
