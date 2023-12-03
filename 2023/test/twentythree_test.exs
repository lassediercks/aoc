defmodule TwentythreeTest do
  use ExUnit.Case

  test "extract numbers from string" do
    assert Dayone.Dayone.resultFromString("agljasdgl13lajsdg") == 13
    assert Dayone.Dayone.resultFromString("5dsgadg6") == 56
    assert Dayone.Dayone.resultFromString("dsgadg34") == 34
    assert Dayone.Dayone.resultFromString("#%@)*%)#dsgad4612362g39") == 49
    assert Dayone.Dayone.resultFromString("8nprjs") == 88
  end

  # test "extract numbers from string" do
  #   assert Dayone.Dayone.resultFromStringWithString("one5six9") == 19
  # end

  test "convert to number" do
    assert Dayone.Dayone.numberStringMatch("one5fivetwothree9") == "155239"
    assert Dayone.Dayone.numberStringMatch("onsadge3nine") == "onsadge39"
    assert Dayone.Dayone.numberStringMatch("twotwotwotwofive") == "22225"
  end

  test "combine both" do
    assert Dayone.Dayone.numberStringMatch("two1nine") |> Dayone.Dayone.resultFromString() === 29

    assert Dayone.Dayone.numberStringMatch("eightwothree") |> Dayone.Dayone.resultFromString() ===
             83

    assert Dayone.Dayone.numberStringMatch("abcone2threexyz") |> Dayone.Dayone.resultFromString() ===
             13

    assert Dayone.Dayone.numberStringMatch("xtwone3four") |> Dayone.Dayone.resultFromString() ===
             24

    assert Dayone.Dayone.numberStringMatch("4nineeightseven2") |> Dayone.Dayone.resultFromString() ===
             42

    assert Dayone.Dayone.numberStringMatch("zoneight234") |> Dayone.Dayone.resultFromString() ===
             14

    assert Dayone.Dayone.numberStringMatch("7pqrstsixteen") |> Dayone.Dayone.resultFromString() ===
             76
  end
end
