defmodule Mix.Tasks.Solve2024 do
  @moduledoc "Solves all advent of code 2024 puzzles"
  @shortdoc "Solve AOC2024"

  use Mix.Task

  @impl Mix.Task
  def run(_args) do
    Lixaoc.AOC2024.Day1.solve()
  end
end
