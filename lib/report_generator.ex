defmodule ReportGenerator do
  def build(filename), do: "report_files/#{filename}" |> File.read() |> handle_file()

  defp handle_file({:ok, file_content}), do: file_content
  defp handle_file({:error, _reason}), do: "Error while opening file!"
end
