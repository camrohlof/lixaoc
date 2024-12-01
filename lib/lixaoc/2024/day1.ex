defmodule Lixaoc.AOC2024.Day1 do
  def solve do
    data = File.read!("./inputs/2024/day1.txt")

    parsed_nums =
      String.split(data, "\n")
      |> Enum.map(fn x -> x |> String.split("   ") end)
      |> Enum.filter(fn x -> List.first(x) != "" end)
      |> Enum.reduce(%{col1: [], col2: []}, fn row, acc ->
        %{
          col1: [row |> List.first() |> String.to_integer() | acc.col1],
          col2: [row |> List.last() |> String.to_integer() | acc.col2]
        }
      end)

    col1 = Enum.sort(parsed_nums.col1)
    col2 = Enum.sort(parsed_nums.col2)

    part1 =
      Enum.zip_reduce(Enum.sort(parsed_nums.col1), Enum.sort(parsed_nums.col2), 0, fn x, y, acc ->
        acc + abs(x - y)
      end)

    IO.puts("Part 1: #{part1}")

    mult_map =
      col2
      |> Enum.reduce(%{}, fn num, acc ->
        if Map.has_key?(acc, num) do
          Map.update!(acc, num, fn x -> x + 1 end)
        else
          Map.put(acc, num, 1)
        end
      end)

    part2 =
      col1
      |> Enum.reduce(0, fn x, acc ->
        if Map.has_key?(mult_map, x) do
          acc + x * mult_map[x]
        else
          acc
        end
      end)

    IO.puts("Part 2: #{part2}")
  end
end
