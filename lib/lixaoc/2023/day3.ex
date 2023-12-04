defmodule Lixaoc.AOC2023.Day3 do
  def setup() do
    File.read!("./inputs/2023/day3.txt")
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split(&1, "", trim: true))
    |> Enum.into(Arrays.new())
  end

  def solve() do
    setup() |> IO.inspect()
  end
end
