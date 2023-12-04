defmodule Day1 do
  def solve do
    {result, data} = File.read("./input/day1.txt")
    IO.puts(result)

    String.split(data, "\n")
    |> Enum.chunk_while(
      [],
      fn element, acc ->
        if element == "" do
          {:cont, acc, []}
        else
          {:cont, [String.to_integer(element) | acc]}
        end
      end,
      fn
        [] -> {:cont, []}
        acc -> {:cont, acc, []}
      end
    )
    |> Enum.map(fn innerList ->
      Enum.reduce(innerList, 0, fn item, acc -> item + acc end)
    end)
    |> Enum.sort_by(& &1, :desc)
    |> Enum.take(3)
    |> IO.inspect()
    |> Enum.reduce(fn x, acc -> x + acc end)
    |> IO.inspect()
  end
end

Day1.solve()
:ok
