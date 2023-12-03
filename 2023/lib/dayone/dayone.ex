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

  # def replaceStringSafe(content, pattern, replacment) do
  #   ret =
  #     case String.replace(content, pattern, replacment) do
  #       {:ok, val} -> val
  #     end

  #   IO.puts(ret)
  #   ret
  # end

  def numberStringMatch(content) do
    # IO.inspect(content, label: "input")

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

    new =
      digit_map
      |> Enum.reduce(content, fn {key, val}, acc ->
        keystring = Atom.to_string(key)

        # IO.inspect(acc, label: "acc is")
        # IO.puts(key)
        # IO.puts(val)

        acc =
          if String.match?(acc, ~r/#{keystring}/) do
            String.replace(acc, keystring, "#{key}#{val}#{key}")
          else
            acc
          end

        # IO.inspect(acc, label: "acc is")
        acc
        # [acc | String.match?(content, )]/
        # if add != nil do
        #   [add | acc]
        # else
        #   acc
        # end
      end)

    # IO.inspect(new, label: "new")

    # keys = digit_map |> Enum.map(fn {key, _} -> Atom.to_string(key) end)

    # out =
    #   String.replace(content, keys, fn x ->
    #     digit_map[String.to_atom(x)]
    #   end)

    # # IO.inspect(out, label: "output")
    # out
    new
  end

  def total do
    input = getInput()
    input = input |> Enum.map(&resultFromString/1)
    input = Enum.sum(input)
    IO.inspect(input, label: "Part one answer")

    parttwo = getInput()

    parttwo =
      parttwo
      |> Enum.map(fn x ->
        numberStringMatch(x) |> resultFromString
      end)

    parttwo = Enum.sum(parttwo)
    IO.inspect(parttwo, label: "Part two answer")
  end

  def inputToSum(input) do
    input
    |> Enum.map(fn x ->
      numberStringMatch(x) |> resultFromString
    end)
    |> Enum.sum()
  end

  def totalTwo do
    getInput()
    |> Enum.map(fn x ->
      numberStringMatch(x) |> resultFromString
    end)
    |> Enum.sum()
  end
end
