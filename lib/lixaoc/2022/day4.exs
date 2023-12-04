defmodule Day4 do
  def extract_ranges(line) do
    Regex.named_captures(~r/(?<start1>\d+)-(?<end1>\d+),(?<start2>\d+)-(?<end2>\d+)/, line)
  end

  def matches_to_range(nil), do: nil

  def matches_to_range(match_map) do
    start1 = String.to_integer(match_map["start1"])
    start2 = String.to_integer(match_map["start2"])
    end1 = String.to_integer(match_map["end1"])
    end2 = String.to_integer(match_map["end2"])
    {start1..end1, start2..end2}
  end

  def check_range(nil), do: 0

  def check_range(ranges) do
    cond do
      String.to_integer(ranges["start1"]) <= String.to_integer(ranges["start2"]) &&
          String.to_integer(ranges["end1"]) >= String.to_integer(ranges["end2"]) ->
        1

      String.to_integer(ranges["start2"]) <= String.to_integer(ranges["start1"]) &&
          String.to_integer(ranges["end2"]) >= String.to_integer(ranges["end1"]) ->
        1

      true ->
        0
    end
  end

  def check_disjoint(nil), do: 0

  def check_disjoint(ranges) do
    {a, b} = ranges

    if Range.disjoint?(a, b) do
      0
    else
      1
    end
  end

  def solve(:part1) do
    File.read!("./input/day4.txt")
    |> String.split("\n")
    |> Enum.map(fn x -> extract_ranges(x) end)
    |> Enum.map(fn x -> check_range(x) end)
    |> Enum.sum()
    |> IO.inspect()
  end

  def solve(:part2) do
    File.read!("./input/day4.txt")
    |> String.split("\n")
    |> Enum.map(fn x -> extract_ranges(x) end)
    |> Enum.map(fn x -> matches_to_range(x) end)
    |> Enum.map(fn x -> check_disjoint(x) end)
    |> Enum.sum()
    |> IO.inspect()
  end
end

Day4.solve(:part1)
Day4.solve(:part2)

