defmodule ReportGenerator do
  alias ReportGenerator.Parser

  def build(filename) do
    Parser.parse_file(filename)
    |> Enum.reduce(report_acc(), fn line, report -> sum_values(line, report) end)
  end

  defp sum_values([id, _food_name, price], report), do: Map.put(report, id, report[id] + price)

  defp report_acc, do: Enum.into(1..30, %{}, fn x -> {Integer.to_string(x), 0} end)
end
