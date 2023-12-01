defmodule Day1 do
  def extract_nums(str) do
    Regex.scan(~r/\d/, str)
    |> List.flatten()
    |> concat_digits()
    |> String.to_integer()
  end

  def concat_digits([]), do: "0"

  def concat_digits(list) do
    a = Enum.fetch!(list, 0)
    b = Enum.fetch!(Enum.reverse(list), 0)
    a <> b
  end

  def solve(:part1) do
    File.read!("./inputs/day1.txt")
    |> String.split("\n")
    |> Enum.map(fn x -> extract_nums(x) end)
    |> Enum.sum()
    |> IO.inspect()
  end
end

Day1.solve(:part1)
