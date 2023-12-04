defmodule Day2 do
  # common
  def split_line(line) do
    line |> String.split(":", trim: true) |> parse_game_id()
  end

  def parse_game_id([list | rest]) do
    {String.slice(list, 5, String.length(list)), List.first(rest)}
  end

  def parse_games({id, game}) do
    parsed_game =
      game
      |> String.split(";", trim: true)
      |> Enum.flat_map(&String.split(&1, ",", trim: true))
      |> Enum.map(&String.split(&1, " ", trim: true))
      |> Enum.map(fn [x, y] -> [String.to_integer(x), y] end)

    {id, parsed_game}
  end

  # part1
  def check_game({id, game}) do
    game_validity =
      game
      |> Enum.map(&valid_set?(&1))
      |> Enum.all?()

    {String.to_integer(id), game_validity}
  end

  def valid_set?([num, "red"]) when num <= 12, do: true
  def valid_set?([_, "red"]), do: false
  def valid_set?([num, "green"]) when num <= 13, do: true
  def valid_set?([_, "green"]), do: false
  def valid_set?([num, "blue"]) when num <= 14, do: true
  def valid_set?([_, "blue"]), do: false

  # part2
  def get_power({_, game}) do
    game
    |> Enum.reduce(%{}, &get_maxes(&1, &2))
    |> Map.values()
    |> Enum.reduce(fn x, acc -> x * acc end)
  end

  def get_maxes([num, "red"], acc),
    do: Map.update(acc, :red, num, fn existing -> max(existing, num) end)

  def get_maxes([num, "blue"], acc),
    do: Map.update(acc, :blue, num, fn existing -> max(existing, num) end)

  def get_maxes([num, "green"], acc),
    do: Map.update(acc, :green, num, fn existing -> max(existing, num) end)

  def setup() do
    File.read!("./inputs/day2.txt")
    |> String.split("\n", trim: true)
    |> Enum.map(&split_line(&1))
    |> Enum.map(&parse_games(&1))
  end

  def solve(:part1) do
    setup()
    |> Enum.map(&check_game(&1))
    |> Enum.reduce(0, fn x, acc ->
      if elem(x, 1) do
        acc + elem(x, 0)
      else
        acc
      end
    end)
    |> IO.inspect()
  end

  def solve(:part2) do
    setup()
    |> Enum.map(&get_power(&1))
    |> Enum.sum()
    |> IO.inspect()
  end
end

Day2.solve(:part1)
Day2.solve(:part2)

