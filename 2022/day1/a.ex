defmodule DayOne do
  def scan(input_file) do
    temp = File.stream!(input_file) |> Enum.reduce({0, 0}, &scan_line/2)
    IO.inspect(temp)
    {_, max} = temp
    max
  end

  defp scan_line("\n", {acc, max}) do
    IO.puts('newline case')
    IO.puts("acc is #{acc}")
    IO.puts("max is #{max}")

    if acc > max do
      {0, acc}
    else
      {0, max}
    end
  end

  defp scan_line(line, {acc, max}) do
    IO.puts("calculate case")
    IO.puts("line is #{line}")
    IO.puts("acc is #{acc}")
    IO.puts("max is #{max}")

    {num, _rem} = Integer.parse(line)
    {acc + num, max}
  end
end

DayOne.scan('./input') |> IO.puts()
