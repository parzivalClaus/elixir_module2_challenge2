defmodule ReportsGeneratorChallengeTest do
  use ExUnit.Case

  describe "build/1" do
    test "builds the report" do
      file_name = "gen_report_test.csv"

      response = ReportsGeneratorChallenge.build(file_name)

      expected_response = %{
        "all_hours" => %{
          "Cleiton" => 0,
          "Daniele" => 36,
          "Danilo" => 0,
          "Diego" => 0,
          "Giuliano" => 0,
          "Jakeliny" => 0,
          "Joseph" => 0,
          "Mayk" => 15,
          "Rafael" => 0,
          "Vinicius" => 0
        },
        "hours_per_month" => %{
          "Daniele" => %{"abril" => 21, "dezembro" => 15},
          "Mayk" => %{"dezembro" => 15}
        },
        "hours_per_year" => %{
          "Daniele" => %{"2016" => 15, "2018" => 21},
          "Mayk" => %{"2017" => 3, "2019" => 12}
        }
      }

      assert response == expected_response
    end
  end

  describe "build_from_many/1" do
    test "when a file list is provided, builds the report" do
      filenames = ["gen_report_test.csv", "gen_report_test.csv"]

      response = ReportsGeneratorChallenge.build_from_many(filenames)

      expected_response =
        {:ok,
         %{
           "all_hours" => %{
             "Cleiton" => 0,
             "Daniele" => 72,
             "Danilo" => 0,
             "Diego" => 0,
             "Giuliano" => 0,
             "Jakeliny" => 0,
             "Joseph" => 0,
             "Mayk" => 30,
             "Rafael" => 0,
             "Vinicius" => 0
           },
           "hours_per_month" => %{
             "Daniele" => %{"abril" => 42, "dezembro" => 30},
             "Mayk" => %{"dezembro" => 30}
           },
           "hours_per_year" => %{
             "Daniele" => %{"2016" => 30, "2018" => 42},
             "Mayk" => %{"2017" => 6, "2019" => 24}
           }
         }}

      assert response == expected_response
    end

    test "when a file list is not provided, returns an error" do
      response = ReportsGeneratorChallenge.build_from_many("banana")

      expected_response = {:error, "Please provide a list of strings"}

      assert response == expected_response
    end
  end
end
