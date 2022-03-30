defmodule ReportGenerator do
  def build(filename) do
    "report_files/#{filename}"
    |> File.stream!()
    |> Enum.reduce(report_acc(), fn line, report ->
      [id, _food_name, price] = parse_line(line)
      Map.put(report, id, report[id] + price)
    end)
  end

  defp parse_line(line) do
    line |> String.trim() |> String.split(",") |> List.update_at(2, &String.to_integer/1)
  end

  defp report_acc, do: Enum.into(1..30, %{}, fn x -> {Integer.to_string(x), 0} end)
end
