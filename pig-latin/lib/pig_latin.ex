defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    String.split(phrase)
    |> Enum.map(fn word ->
      status = starts_vogal(word)

      case status do
        :ok -> word_inverter(word)
        ?u -> word_inverter(word)
        ?q -> exception_q(word, "")
        :error -> word_inverter_consoant(word, "")
      end
    end)
    |> Enum.join(" ")
  end

  defp word_inverter_consoant(word, init) do
    [head | tail] = String.graphemes(word)
    status = starts_vogal(head)

    case status do
      ?q -> exception_q(List.to_string(tail), init <> head)
      ?u -> head <> List.to_string(tail) <> init <> "ay"
      :ok -> head <> List.to_string(tail) <> init <> "ay"
      :error -> word_inverter_consoant(List.to_string(tail), init <> head)
    end
  end

  defp exception_q(word, init) do
    [head | tail] = String.graphemes(word)
    status = starts_vogal(head)

    case status do
      ?q -> exception_q(List.to_string(tail), init <> head)
      ?u -> word_inverter(List.to_string(tail), init <> head)
      :error -> word_inverter_consoant(word, init)
      :ok -> IO.puts(word <> init <> "ay")
    end
  end

  def word_inverter(body, initial) do
    body <> initial <> "ay"
  end

  defp word_inverter(body) do
    body <> "ay"
  end

  defp starts_vogal(word) do
    String.to_charlist(word)
    |> hd
    |> is_vowel()
  end

  defp is_vowel(vowel) do
    case vowel do
      ?a -> :ok
      ?e -> :ok
      ?i -> :ok
      ?o -> :ok
      ?u -> ?u
      ?y -> :ok
      ?x -> :ok
      ?q -> ?q
      _ -> :error
    end
  end
end
