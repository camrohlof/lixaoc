defmodule Day2 do
  def calc_round(string) do
    case string do
      "A X" -> 4
      "A Y" -> 1
      "A Z" -> 7
      "B X" -> 8
      "B Y" -> 5
      "B Z" -> 2
      "C X" -> 3
      "C Y" -> 9
      "C Z" -> 6
      _ -> 0
    end
  end

  def solve do
    {result, data} = File.read("./input/day2.txt")
    IO.puts(result)
    String.split(data, "\n") |> Enum.map(calc_round) |> Enum.sum() |> IO.puts()
  end
end

Day2.solve()
