defmodule ReportsGeneratorChallenge.ParserTest do
  use ExUnit.Case

  alias ReportsGeneratorChallenge.Parser

  describe "parse_file/1" do
    test "parses the file" do
      file_name = "gen_report_test.csv"

      response =
        file_name
        |> Parser.parse_file()
        |> Enum.map(& &1)

      expected_response = [
        ["Daniele", 7, "29", "abril", "2018"],
        ["Mayk", 4, "9", "dezembro", "2019"],
        ["Daniele", 5, "27", "dezembro", "2016"],
        ["Mayk", 1, "2", "dezembro", "2017"],
        ["Daniele", 7, "29", "abril", "2018"],
        ["Mayk", 4, "9", "dezembro", "2019"],
        ["Daniele", 5, "27", "dezembro", "2016"],
        ["Mayk", 1, "2", "dezembro", "2017"],
        ["Daniele", 7, "29", "abril", "2018"],
        ["Mayk", 4, "9", "dezembro", "2019"],
        ["Daniele", 5, "27", "dezembro", "2016"],
        ["Mayk", 1, "2", "dezembro", "2017"]
      ]

      assert response == expected_response
    end
  end
end
