defmodule DndCharacter do
  #Based on https://exercism.io/tracks/elixir/exercises/dnd-character/solutions/3c4198fb62624b609705ac7f95eab2ad
  #study source of __MODULE__
  ## https://www.youtube.com/watch?v=NB58aFTZmrE class 1
  ## https://www.youtube.com/watch?v=qpOYCaRPN0M class 2
  @type t :: %__MODULE__{
          strength: pos_integer(),
          dexterity: pos_integer(),
          constitution: pos_integer(),
          intelligence: pos_integer(),
          wisdom: pos_integer(),
          charisma: pos_integer(),
          hitpoints: pos_integer()
        }

  defstruct ~w[strength dexterity constitution intelligence wisdom charisma hitpoints]a

  @spec modifier(pos_integer()) :: integer()
  def modifier(score) do
    score-10
    |>Integer.floor_div(2)
  end

  @spec ability :: pos_integer()
  def ability do
    for(x <- 1..4, do: Enum.random(1..6))
    |> Enum.sort()
    |> Enum.drop(1)
    |> Enum.sum()
  end

  @spec character :: t()
  def character do
    constitution =ability()
    %__MODULE__{
      strength: ability(),
      dexterity: ability(),
      constitution: constitution,
      intelligence: ability(),
      wisdom: ability(),
      charisma: ability(),
      hitpoints: 10+modifier(constitution)
    }
  end
end
