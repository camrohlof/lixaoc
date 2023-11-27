defmodule Day2 do
  defp string_to_atoms(string, :part1) do
    case string do
      "A X" -> {:rock, :rock, :draw}
      "A Y" -> {:rock, :paper, :win}
      "A Z" -> {:rock, :scissors, :loss}
      "B X" -> {:paper, :rock, :loss}
      "B Y" -> {:paper, :paper, :draw}
      "B Z" -> {:paper, :scissors, :win}
      "C X" -> {:scissors, :rock, :win}
      "C Y" -> {:scissors, :paper, :loss}
      "C Z" -> {:scissors, :scissors, :draw}
      _ -> {:blank}
    end
  end

  defp string_to_atoms(string, :part2) do
    case string do
      "A X" -> {:rock, :scissors, :loss}
      "A Y" -> {:rock, :rock, :draw}
      "A Z" -> {:rock, :paper, :win}
      "B X" -> {:paper, :rock, :loss}
      "B Y" -> {:paper, :paper, :draw}
      "B Z" -> {:paper, :scissors, :win}
      "C X" -> {:scissors, :paper, :loss}
      "C Y" -> {:scissors, :scissors, :draw}
      "C Z" -> {:scissors, :rock, :win}
      _ -> {:blank}
    end
  end

  defp atom_to_value(:rock), do: 1
  defp atom_to_value(:paper), do: 2
  defp atom_to_value(:scissors), do: 3
  defp atom_to_value(:loss), do: 0
  defp atom_to_value(:draw), do: 3
  defp atom_to_value(:win), do: 6

  defp calc_round({:blank}), do: 0

  defp calc_round({_, player, result}) do
    atom_to_value(player) + atom_to_value(result)
  end

  def solve_part1 do
    {result, data} = File.read("./input/day2.txt")
    IO.puts(result)

    String.split(data, "\n")
    |> Enum.map(fn x -> string_to_atoms(x, :part1) end)
    |> Enum.map(fn x -> calc_round(x) end)
    |> Enum.sum()
    |> IO.puts()
  end

  def solve_part2 do
    {result, data} = File.read("./input/day2.txt")
    IO.puts(result)

    String.split(data, "\n")
    |> Enum.map(fn x -> string_to_atoms(x, :part2) end)
    |> Enum.map(fn x -> calc_round(x) end)
    |> Enum.sum()
    |> IO.puts()
  end
end

Day2.solve_part1()
Day2.solve_part2()
