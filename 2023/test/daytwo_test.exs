defmodule TwentythreeTestTwo do
  use ExUnit.Case

  test "disect List from string" do
    assert Daytwo.createGemList(
             "Game 5: 19 blue, 12 red; 19 blue, 2 green, 1 red; 13 red, 11 blue"
           ) === [5, ["19 blue", "12 red", "19 blue", "2 green", "1 red", "13 red", "11 blue"]]
  end

  test "List to Tuple" do
    list = ["19 blue", "12 red", "3 blue", "5 green", "3 red"]

    assert list |> Daytwo.createGameTuple() === [
             {:blue, 19},
             {:red, 12},
             {:blue, 3},
             {:green, 5},
             {:red, 3}
           ]
  end

  test "determine possible" do
    assert Daytwo.determinePossible(
             %{red: 12, green: 13, blue: 14},
             [{:blue, 3}, {:red, 12}, {:green, 13}, {:red, 13}]
           ) === false

    assert Daytwo.determinePossible(%{red: 12, green: 13, blue: 14}, [
             {:blue, 3},
             {:red, 12},
             {:green, 13},
             {:red, 12}
           ]) === true
  end

  test "determine minimum needed" do
    assert Daytwo.determineMinimumGems([
             {:blue, 3},
             {:red, 12},
             {:green, 13},
             {:red, 13},
             {:green, 15},
             {:green, 19}
           ]) === %{
             blue: 3,
             red: 13,
             green: 19
           }
  end

  test "power of gemmap" do
    assert Daytwo.gemMapPower(%{
             blue: 3,
             red: 13,
             green: 19
           }) === 741
  end
end
