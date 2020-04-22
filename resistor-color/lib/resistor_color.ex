defmodule ResistorColor do
  @moduledoc false
  @lista [
    "black",
    "brown",
    "red",
    "orange",
    "yellow",
    "green",
    "blue",
    "violet",
    "grey",
    "white"
  ]

  @spec colors() :: list(String.t())

  def colors do
    @lista
  end

  @spec code(String.t()) :: integer()
  def code(color) do
    Enum.find_index(@lista, fn x -> x == color end)
  end
end
