defmodule ReportGenerator do
  alias ReportGenerator.Parser

  @available_foods [
    "açaí",
    "churrasco",
    "esfirra",
    "hambúrger",
    "pastel",
    "pizza",
    "prato_feito",
    "sushi"
  ]

  def build(filename) do
    Parser.parse_file(filename)
    |> Enum.reduce(report_acc(), fn line, report -> sum_values(line, report) end)
  end

  def fetch_higher_cost(report), do: Enum.max_by(report, fn {_key, value} -> value end)

  defp sum_values([id, food_name, price], %{"users" => users, "foods" => foods} = report) do
    users = Map.put(users, id, users[id] + price)
    foods = Map.put(foods, food_name, foods[food_name] + 1)

    %{report | "users" => users, "foods" => foods}
  end

  defp report_acc do
    users = Enum.into(1..30, %{}, fn x -> {x, 0} end)
    foods = Enum.into(@available_foods, %{}, fn x -> {Integer.to_string(x), 0} end)

    %{"users" => users, "foods" => foods}
  end
end
