defmodule TwentythreeTestThree do
  use ExUnit.Case

  test "extracts int index from string" do
    assert Daythree.intIndexFromString("467..11...") === [
             %{
               value: 467,
               startsAt: 0,
               length: 3
             },
             %{
               value: 11,
               startsAt: 5,
               length: 2
             }
           ]
  end

  test "returns validity of intMap" do
    assert Daythree.isValid(
             %{
               value: "11",
               startsAt: 5,
               length: 2
             },
             [
               "467..11...",
               "...*......"
             ]
           ) === false

    assert Daythree.isValid(
             %{
               value: "467",
               startsAt: 0,
               length: 3
             },
             [
               "467..11...",
               "...*......"
             ]
           ) === true

    assert Daythree.isValid(
             %{
               value: "58",
               startsAt: 8,
               length: 2
             },
             [
               "617*......",
               ".....+.58.",
               "..592....."
             ]
           ) === false
  end
end
