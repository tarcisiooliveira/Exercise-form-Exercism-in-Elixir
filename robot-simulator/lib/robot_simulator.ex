defmodule RobotSimulator do
  @directions [:north, :east, :south, :west]
  @command ["A", "L", "R"]
  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """

  def create(), do: {:north, {0, 0}}
  def create({x, y}), do: {:north, {x, y}}

  def create(direction) when is_atom(direction) and direction in @directions,
    do: {direction, {0, 0}}

  # @spec create(direction :: atom, position :: {integer, integer}) :: {Atom, Tuple}
  def create(direction, {a, b})
      when direction in @directions and is_integer(a) and is_integer(b),
      do: {direction, {a, b}}

  def create(direction, _position)
      when direction not in @directions,
      do: {:error, "invalid direction"}

  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(_direction, _position), do: {:error, "invalid position"}

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
    valid =
      String.codepoints(instructions)
      |> Enum.all?(fn x -> x in @command end)

    case valid do
      false -> {:error, "invalid instruction"}
      true -> execute(robot, String.codepoints(instructions))
    end
  end

  defp execute(robot, [head | []]) do
    case head do
      "R" ->
        {rotate("R", direction(robot)), position(robot)}

      "L" ->
        {rotate("L", direction(robot)), position(robot)}

      "A" ->
        move(robot)
    end
  end

  defp execute(robot, [head | tail]) do
    case head do
      "R" ->
        {rotate("R", direction(robot)), position(robot)}
        |> execute(tail)

      "L" ->
        {rotate("L", direction(robot)), position(robot)}
        |> execute(tail)

      "A" ->
        move(robot)
        |> execute(tail)
    end
  end

  # defp move({direction, {x, y}}) do
  #   case direction do
  #     :north -> {direction, {x, y + 1}}
  #     :east -> {direction, {x + 1, y}}
  #     :south -> {direction, {x, y - 1}}
  #     :west -> {direction, {x - 1, y}}
  #   end
  # end

  defp move({:north, {x, y}}), do: {:north, {x, y + 1}}
  defp move({:east, {x, y}}), do: {:east, {x + 1, y}}
  defp move({:south, {x, y}}), do: {:south, {x, y - 1}}
  defp move({:west, {x, y}}), do: {:west, {x - 1, y}}

  # source modified by lucafuelbier's solution
  defp rotate("R", :north), do: :east
  defp rotate("R", :east), do: :south
  defp rotate("R", :south), do: :west
  defp rotate("R", :west), do: :north

  # defp rotate("R", direction) do
  #   case direction do
  #     :north -> :east
  #     :east -> :south
  #     :south -> :west
  #     :west -> :north
  #   end
  # end

  defp rotate("L", :north), do: :west
  defp rotate("L", :east), do: :north
  defp rotate("L", :south), do: :east
  defp rotate("L", :west), do: :south

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction({direction, _position}), do: direction

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position({_direction, position}), do: position
end
