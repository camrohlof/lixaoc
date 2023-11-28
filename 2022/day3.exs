defmodule Day3 do
  def create_priority_map do
    lowerCase = ?a..?z |> Enum.to_list() |> Enum.map(fn x -> List.to_string([x]) end)
    upperCase = ?A..?Z |> Enum.to_list() |> Enum.map(fn x -> List.to_string([x]) end)
    fullList = lowerCase ++ upperCase
    fullList |> Enum.zip(1..52) |> Enum.into(%{})
  end

  def find_intersection(list) do
    [a, b, c] = list
    item = MapSet.intersection(a, b) |> MapSet.intersection(c) |> MapSet.to_list() |> List.first()
  end

  def solve(part) when part == :part1 do
    IO.puts("Part 1:")

    priority_map = create_priority_map()

    File.read!("./input/day3.txt")
    |> String.split("\n")
    |> Enum.map(fn x -> String.split_at(x, Integer.floor_div(String.length(x), 2)) end)
    |> Enum.map(fn x ->
      {Enum.into(String.split(elem(x, 0), "", trim: true), %MapSet{}),
       Enum.into(String.split(elem(x, 1), "", trim: true), %MapSet{})}
    end)
    |> Enum.map(fn x ->
      List.first(MapSet.to_list(MapSet.intersection(elem(x, 0), elem(x, 1))))
    end)
    |> Enum.map(fn x -> Map.get(priority_map, x, 0) end)
    |> Enum.sum()
    |> IO.inspect()
  end

  def solve(part) when part == :part2 do
    IO.puts("Part 2:")

    priority_map = create_priority_map()

    File.read!("./input/day3.txt")
    |> String.split("\n", trim: true)
    |> Enum.map(fn x -> Enum.into(String.split(x, "", trim: true), %MapSet{}) end)
    |> Enum.chunk_every(3)
    |> Enum.map(fn x -> find_intersection(x) end)
    |> Enum.map(fn x -> Map.get(priority_map, x, 0) end)
    |> Enum.sum()
    |> IO.inspect()
  end
end

Day3.solve(:part1)
Day3.solve(:part2)
