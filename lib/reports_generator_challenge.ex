defmodule ReportsGeneratorChallenge do
  alias ReportsGeneratorChallenge.Parser

  @available_names [
    "Daniele",
    "Mayk",
    "Danilo",
    "Giuliano",
    "Jakeliny",
    "Joseph",
    "Cleiton",
    "Diego",
    "Vinicius",
    "Rafael"
  ]

  def build(filename) do
    filename
    |> Parser.parse_file()
    |> Enum.reduce(report_acc(), fn line, report -> sum_values(line, report) end)
  end

  defp report_acc do
    all_hours = Enum.into(@available_names, %{}, fn x -> {x, 0} end)
    hours_per_month = %{}
    hours_per_year = %{}

    build_report(all_hours, hours_per_month, hours_per_year)
  end

  defp sum_values([name, hour, _day, month, year], %{
         "all_hours" => all_hours,
         "hours_per_month" => hours_per_month,
         "hours_per_year" => hours_per_year
       }) do
    all_hours = merge_maps(all_hours, %{name => hour})

    hours_per_month = merge_sub(hours_per_month, %{name => %{month => hour}})

    hours_per_year = merge_sub(hours_per_year, %{name => %{year => hour}})

    build_report(all_hours, hours_per_month, hours_per_year)
  end

  defp merge_maps(map1, map2) do
    Map.merge(map1, map2, fn _key, value1, value2 -> value1 + value2 end)
  end

  defp merge_sub(map1, map2) do
    Map.merge(map1, map2, fn _k, v1, v2 ->
      merge_maps(v1, v2)
    end)
  end

  defp build_report(all_hours, hours_per_month, hours_per_year) do
    %{
      "all_hours" => all_hours,
      "hours_per_month" => hours_per_month,
      "hours_per_year" => hours_per_year
    }
  end
end
