defmodule ReportGenerator do
  def build(filename) do
    case File.read("report_files/#{filename}") do
      {:ok, result} -> result
      {:error, reason} -> reason
    end
  end
end
