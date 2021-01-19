defmodule TwelveDays do
  @day [
    "first",
    "second",
    "third",
    "fourth",
    "fifth",
    "sixth",
    "seventh",
    "eighth",
    "ninth",
    "tenth",
    "eleventh",
    "twelfth"
  ]

  @gift [
    " a Partridge in a Pear Tree.",
    " two Turtle Doves, and",
    " three French Hens,",
    " four Calling Birds,",
    " five Gold Rings,",
    " six Geese-a-Laying,",
    " seven Swans-a-Swimming,",
    " eight Maids-a-Milking,",
    " nine Ladies Dancing,",
    " ten Lords-a-Leaping,",
    " eleven Pipers Piping,",
    " twelve Drummers Drumming,"
  ]
  @doc """
  Given a number, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """
  @spec verse(number :: integer) :: String.t()

  def verse(number) do
    "On the #{Enum.at(@day, number - 1)} day of Christmas my true love gave to me:" <>
      complete(number)
  end

  defp complete(number) when number > 1 do
    Enum.at(@gift, number - 1) <> complete(number - 1)
  end

  defp complete(1), do: Enum.at(@gift, 0)

  @doc """
  Given a starting_verse and an ending_verse, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) do
    starting_verse..ending_verse
    |> Enum.map_join("\n", &verse(&1))
  end

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing() :: String.t()
  def sing do
    verses(1, 12)
  end
end
