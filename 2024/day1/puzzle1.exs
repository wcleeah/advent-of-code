defmodule Day1.Puzzle1 do
  def read_file() do
    File.read("./puzzle_input.txt")
  end

  def split(arr) do
    {
      Enum.slice(arr, 0..-1//2)
      |> Enum.sort(),
      Enum.slice(arr, 1..-1//2)
      |> Enum.sort()
    }
  end

  def process() do
    { :ok, input } = read_file()

    input
    |> String.split()
    |> Enum.map(&(String.to_integer(&1)))
    |> split()
    |> total(0)
  end

  def total({[head1 | tail1], [head2 | tail2]}, acc) do
    total({tail1, tail2}, acc + abs(head1 - head2))
  end

  def total({[], []}, acc) do
    acc
  end
end
