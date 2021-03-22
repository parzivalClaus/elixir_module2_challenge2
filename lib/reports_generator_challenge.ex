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
    names = Enum.into(@available_names, %{}, fn x -> {x, 0} end)

    build_report(names)
  end

  defp sum_values([name, hour, _day, _month, _year], %{"all_hours" => names}) do
    names = Map.put(names, name, names[name] + hour)

    build_report(names)
  end

  defp build_report(names), do: %{"all_hours" => names}
end
