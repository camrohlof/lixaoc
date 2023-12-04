defmodule Day1 do
  @word_map %{
    "zerone" => "01",
    "twone" => "21",
    "oneight" => "18",
    "nineight" => "98",
    "eightwo" => "82",
    "eighthree" => "83",
    "zero" => "0",
    "one" => "1",
    "two" => "2",
    "three" => "3",
    "four" => "4",
    "five" => "5",
    "six" => "6",
    "seven" => "7",
    "eight" => "8",
    "nine" => "9"
  }

  @word_keys [
    "zerone",
    "twone",
    "oneight",
    "nineight",
    "eightwo",
    "eighthree",
    "zero",
    "one",
    "two",
    "three",
    "four",
    "five",
    "six",
    "seven",
    "eight",
    "nine"
  ]
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

  def replace_word_nums(str) do
    if String.contains?(str, Map.keys(@word_map)) do
      which_word(str) |> Enum.filter(fn x -> x != nil end) |> replace_word(str)
    else
      str
    end
  end

  def which_word(str) do
    @word_keys
    |> Enum.map(fn word ->
      if String.contains?(str, word) do
        word
      end
    end)
  end

  def replace_word([], str), do: str

  def replace_word([word | tail], str) do
    newStr = Regex.replace(~r/#{word}/, str, @word_map[word])
    replace_word(tail, newStr)
  end

  def solve(:part1) do
    File.read!("./inputs/day1.txt")
    |> String.split("\n")
    |> Enum.map(fn x -> extract_nums(x) end)
    |> Enum.sum()
    |> IO.inspect()
  end

  def solve(:part2) do
    File.read!("./inputs/day1.txt")
    |> String.split("\n")
    |> Enum.map(fn x -> replace_word_nums(x) end)
    |> Enum.map(fn x -> extract_nums(x) end)
    |> Enum.sum()
    |> IO.inspect()
  end
end

Day1.solve(:part1)
Day1.solve(:part2)
