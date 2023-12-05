defmodule Daytwo do
  def getInput do
    {:ok, content} = File.read("./lib/daytwo/input")
    String.split(content, "\n")
  end

  def createGemList(string) do
    chunks = String.split(string, ": ")
    # IO.inspect(chunks)
    [gameID, gems] = chunks

    gems =
      gems
      |> String.split(";")
      |> Enum.flat_map(&String.split(&1, ", "))
      |> Enum.map(&String.trim/1)

    [_, id] = String.split(gameID, " ")

    {id, _} = Integer.parse(id)

    [id, gems]
  end

  # def createGameTuple(gemList) do
  #   # IO.inspect(gemList, label: "input")

  #   Enum.reduce(gemList, %{}, fn val, acc ->
  #     valuelist = String.split(val, " ")
  #     [value | key] = valuelist
  #     key = key |> List.to_string() |> String.to_atom()
  #     {value, _} = Integer.parse(value)
  #     Map.update(acc, key, value, fn existing -> existing + value end)
  #   end)
  # end

  def createGameTuple(gemList) do
    # IO.inspect(gemList, label: "input")

    Enum.reduce(gemList, [], fn val, acc ->
      valuelist = String.split(val, " ")
      [value | key] = valuelist
      key = key |> List.to_string() |> String.to_atom()
      {value, _} = Integer.parse(value)

      addition = {key, value}

      acc ++ [addition]
    end)
  end

  def determinePossible(gemAmount, game) do
    Enum.map(game, fn {key, val} ->
      # IO.inspect(key, label: "key")
      # IO.inspect(val, label: "val")
      # IO.inspect(Map.get(gemAmount, key), label: "draw key")
      # IO.inspect(Map.get(gemAmount, key) < val, label: "draw key is smaller than val")
      Map.get(gemAmount, key) < val
    end)
    |> Enum.count(&(&1 == true)) === 0
  end

  def amountOfPossibles(gemAmount) do
    lists = getInput() |> Enum.map(&createGemList/1)

    tuples =
      lists
      |> Enum.map(fn [id, list] ->
        # IO.inspect(id)
        # IO.inspect(list)
        [id] ++ createGameTuple(list)
      end)

    possibles =
      tuples
      |> Enum.map(fn [id | list] ->
        IO.inspect(id)
        IO.inspect(list)
        [id] ++ determinePossible(gemAmount, list)
      end)

    truthies =
      Enum.reduce(possibles, 0, fn [id | possible], acc ->
        if possible do
          acc + id
        else
          acc
        end
      end)

    # IO.inspect(tuples)
    # |> Enum.map(&createGemMap/1)
    # |> Enum.map(fn x -> determinePossible(gemAmount, x) end)
  end
end
