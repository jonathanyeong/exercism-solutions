defmodule RobotSimulator do
  # TODO:
  # We should have a mapping of direction to positions
  # e.g. North:  {0, 1} -> move x 0 and y 1 forward
  # e.g. South:  {0, -1} -> move x 0 and y 1 backward
  # Then we need to figure out how to get the direction when you turn
  # We could use Enum.find_index combined with Enum.fetch with the new index.
  # Left -1 and right +1

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(direction \\ nil, position \\ nil)

  def create(nil, nil) do
    %{direction: :north, position: {0, 0}}
  end

  def create(direction, position) do
    with {:ok, direction} <- validate_direction(direction),
         {:ok, position} <- validate_position(position)
    do
      %{direction: direction, position: position}
    else
      err -> err
    end
  end

  defp validate_direction(direction) when is_atom(direction) do
    valid_directions = [:north, :east, :south, :west]
    if Enum.member?(valid_directions, direction) do
      {:ok, direction}
    else
      {:error, "invalid direction"}
    end
  end

  defp validate_direction(_invalid) do
    {:error, "invalid direction"}
  end

  defp validate_position(position) when is_tuple(position) and tuple_size(position) == 2 do
    if position |> elem(0) |> is_integer() && position |> elem(1) |> is_integer() do
      {:ok, position}
    else
      {:error, "invalid position"}
    end
  end

  defp validate_position(_invalid) do
    {:error, "invalid position"}
  end



  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
    String.split(instructions, "") |> Enum.reduce(position(robot), simulate(x, acc, robot))
  end

  def simulate(x, acc, robot) when is_string(x) do
    moves = %{north: {0, 1}, east: {1, 0}, south: {0, -1}, west: {-1, 0}}
    case x do
      "A" ->
        update_position(robot, Map.get(moves, direction(robot)))
      "R" ->
        turn(robot, 1)
      "L" ->
        turn(robot, -1)
    end
  end

  defp update_position(robot, move) do
    pos = position(robot)
    pos
    create(direction(robot), pos)
  end

  defp turn(robot, direction) do
    if direction == 1 do
      # if :north then east
      # if :east then south
      # if :south then west
      # if :west then north
    else
      # if :north then west
      # if :east then North
      # if :south then east
      # if :west then south
    end
  end
  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(%{direction: direction} = _robot) do
    direction
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(%{position: position} = _robot) do
    position
  end
end
