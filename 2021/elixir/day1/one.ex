# Title: Untitled notebook

# ── Section ──

IO.puts File.read!("input.txt")
|> String.split("\n", trim: true)
|> Enum.map(&String.to_integer/1)
|> Enum.chunk_every(2, 1, :discard)
|> Enum.count(fn [left, right] -> right > left end)

# IO.puts "Increased by"
# IO.puts input


# IO.puts "Increased by"
# IO.puts input
# |> Enum.chunk_every(3, 1, :discard)
# |> Enum.count(fn [left, right] -> right > left end)

# File.read("example.txt")
# |> String.split("\n", trim: true)
# |> Enum.map(&String.to_integer/1)
# |> Enum.chunk_every(2,1, :discard)
# |> IO.puts Enum.count(fn [left,right] -> right > left end)

# defmodule Day1 do
#   def part1([head | tail]) do
#     # IO.puts(head > head + 1)
#     IO.puts('happy nowww')
#     part1(tail)
#   end

#   def part1([]) do
#     IO.puts('the end is here')
#   end
# end


# Day1.part1(file)
# Day1.part1(file)
