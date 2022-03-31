defmodule ReportGenerator.ParserTest do
  use ExUnit.Case

  alias ReportGenerator.Parser

  describe "parse_file/1" do
    test "parses the file" do
      file_name = "report_test.csv"

      response = file_name |> Parser.parse_file() |> Enum.map(fn x -> x end)

      expect_response = [
        ["1", "pizza", 48],
        ["2", "açaí", 45],
        ["3", "hambúrguer", 31],
        ["4", "esfirra", 42],
        ["5", "hambúrguer", 49],
        ["6", "esfirra", 18],
        ["7", "pizza", 27],
        ["8", "esfirra", 25],
        ["9", "churrasco", 24],
        ["10", "churrasco", 36]
      ]

      assert response == expect_response
    end
  end
end
