defmodule Day2 do
  defp string_to_atoms(string, :part1) do
    case string do
      "A X" -> {:rock, :draw}
      "A Y" -> {:paper, :win}
      "A Z" -> {:scissors, :loss}
      "B X" -> {:rock, :loss}
      "B Y" -> {:paper, :draw}
      "B Z" -> {:scissors, :win}
      "C X" -> {:rock, :win}
      "C Y" -> {:paper, :loss}
      "C Z" -> {:scissors, :draw}
      _ -> {:blank}
    end
  end

  defp string_to_atoms(string, :part2) do
    case string do
      "A X" -> {:scissors, :loss}
      "A Y" -> {:rock, :draw}
      "A Z" -> {:paper, :win}
      "B X" -> {:rock, :loss}
      "B Y" -> {:paper, :draw}
      "B Z" -> {:scissors, :win}
      "C X" -> {:paper, :loss}
      "C Y" -> {:scissors, :draw}
      "C Z" -> {:rock, :win}
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

  defp calc_round({player, result}) do
    atom_to_value(player) + atom_to_value(result)
  end

  def solve(part) do
    {result, data} = File.read("./input/day2.txt")
    IO.puts("#{part}: #{result}")

    String.split(data, "\n")
    |> Enum.map(fn x -> string_to_atoms(x, part) end)
    |> Enum.map(fn x -> calc_round(x) end)
    |> Enum.sum()
    |> IO.puts()
  end
end

Day2.solve(:part1)
Day2.solve(:part2)
