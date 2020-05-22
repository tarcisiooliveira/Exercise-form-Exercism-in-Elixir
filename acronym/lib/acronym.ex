defmodule Acronym do
  @alphabet_up ~w(A B C D E F G H I J K L M N O P Q R S T U V X Y W Z)

  def abbreviate(string) do
    String.split(string, [" ", "!", "_", ",", "-", "."], trim: true)
    |> Enum.map(fn word ->
      palavra = String.graphemes(word)
      cabeca = hd(palavra)

      calda =
        tl(palavra)
        |> Enum.map(fn letter ->
          case Enum.member?(@alphabet_up, letter) do
            true -> letter
            false -> ""
          end
        end)
        |> Enum.join()

      if String.length(cabeca <> calda) == String.length(word) do
        cabeca
      else
        cabeca <> calda
      end
    end)
    |> Enum.join()
    |> String.upcase()
  end

end
