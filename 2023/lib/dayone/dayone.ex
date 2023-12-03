defmodule Dayone.Dayone do
  def getInput do
    {:ok, content} = File.read("./lib/dayone/input")
    String.split(content, "\n")
  end

  def parse(character) do
    case Integer.parse(character) do
      {num, ""} -> num
      _ -> nil
    end
  end

  def resultFromString(content) do
    res =
      String.codepoints(content)
      |> Enum.map(&parse/1)
      |> Enum.filter(&(&1 != nil))

    first = List.first(res)
    last = List.first(Enum.reverse(res))

    result =
      case Enum.count(res) do
        1 ->
          String.to_integer("#{List.first(res)}#{List.first(res)}")

        _ ->
          String.to_integer("#{first}#{last}")
      end

    result
  end

  def numberStringMatch(content) do
    digit_map = %{
      one: "1",
      two: "2",
      three: "3",
      four: "4",
      five: "5",
      six: "6",
      seven: "7",
      eight: "8",
      nine: "9"
    }

    keys = digit_map |> Enum.map(fn {key, _} -> Atom.to_string(key) end)

    String.replace(content, keys, fn x ->
      digit_map[String.to_atom(x)]
    end)
  end

  def total do
    input = getInput()
    input = input |> Enum.map(&resultFromString/1)
    input = Enum.sum(input)
    IO.inspect(input)
  end

  def totalTwo do
    input = getInput()

    input =
      input
      |> Enum.map(fn x ->
        IO.inspect(x, label: "input")
        out = numberStringMatch(x) |> resultFromString
        IO.inspect(out, label: "output")
        out
      end)

    input = Enum.sum(input)
    input
  end
end
