defmodule Daythree do
  def getInput do
    {:ok, content} = File.read("./lib/daythree/input")
    String.split(content, "\n")
  end

  def isValid(intMap, lines) do
    relevantlines =
      Enum.map(lines, fn line ->
        slicedkram = String.slice(line, max(intMap[:startsAt] - 1, 0), intMap[:length] + 2)
        String.match?(slicedkram, ~r/[^0-9.]/)
      end)

    relevantlines |> Enum.find(false, &(&1 === true))
  end

  def intIndexFromString(string) do
    indexes = Regex.scan(~r/[0-9]+/, string, return: :index)

    Enum.map(indexes, fn [{start, length}] ->
      value = String.slice(string, start, length)
      {value, _} = Integer.parse(value)

      %{
        value: value,
        startsAt: start,
        length: length
      }
    end)
  end

  def result do
    content = getInput()

    content
    |> Enum.with_index()
    |> Enum.flat_map(fn {line, index} ->
      intIndexFromString(line)
      |> Enum.map(fn intMap ->
        indexRange = max(index - 1, 0)..(index + 1)
        getLines = Enum.slice(content, indexRange)

        if isValid(intMap, getLines) do
          intMap[:value]
        else
          0
        end
      end)
    end)
    |> Enum.sum()
  end
end
