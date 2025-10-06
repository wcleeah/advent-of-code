defmodule Day1.Puzzle2 do
  def read_file() do
    File.read("./puzzle_input.txt")
  end

  def split(arr) do
    arr
    |> Enum.with_index()
    |> Enum.reduce({[], []}, fn {val, idx}, {left, right} ->
      if rem(idx, 2) == 0, do: {[val | left], right}, else: {left, [val | right]}
    end)
    |> then(fn {left, right} -> {Enum.sort(left), Enum.sort(right)} end)
  end

  def process() do
    {:ok, input} = read_file()

    {arr1, arr2} =
      input
      |> String.split()
      |> Enum.map(&String.to_integer(&1))
      |> split()

    f = Enum.frequencies(arr2)

    Enum.reduce(arr1, 0, fn (a, acc) ->
      acc + Map.get(f, a, 0) * a
    end)
  end
end

# wrong
# defmodule Day1.Puzzle2 do
#   def read_file() do
#     File.read("./puzzle_input.txt")
#   end
#
#   def split(arr) do
#     arr
#     |> Enum.with_index()
#     |> Enum.reduce({[], []}, fn {val, idx}, {left, right} ->
#       if rem(idx, 2) == 0, do: {[val | left], right}, else: {left, [val | right]}
#     end)
#     |> then(fn {left, right} -> {Enum.sort(left), Enum.sort(right)} end)
#   end
#
#   def process() do
#     {:ok, input} = read_file()
#
#     input
#     |> String.split()
#     |> Enum.map(&String.to_integer(&1))
#     |> split()
#     |> score(0)
#   end
#
#   def score({[head1 | tail1], [head2 | tail2]}, acc) when head1 == head2 do
#     score({[head1 | tail1], tail2}, acc + head2)
#   end
#
#   def score({[head1 | tail1], [head2 | tail2]}, acc) when head1 > head2 do
#     score({[head1 | tail1], tail2}, acc)
#   end
#
#   def score({[head1 | tail1], [head2 | tail2]}, acc) when head1 < head2 do
#     score({tail1, [head2 | tail2]}, acc)
#   end
#
#   def score({[], []}, acc) do
#     acc
#   end
#   def score({_, []}, acc) do
#     acc
#   end
#   def score({[], _}, acc) do
#     acc
#   end
# end
