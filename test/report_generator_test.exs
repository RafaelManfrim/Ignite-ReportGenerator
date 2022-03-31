defmodule ReportGeneratorTest do
  use ExUnit.Case

  describe "build/1" do
    test "builds the report" do
      file_name = "report_test.csv"

      response = ReportGenerator.build(file_name)

      expect_response = %{
        "foods" => %{
          "açaí" => 1,
          "churrasco" => 2,
          "esfirra" => 3,
          "hambúrguer" => 2,
          "pastel" => 0,
          "pizza" => 2,
          "prato_feito" => 0,
          "sushi" => 0
        },
        "users" => %{
          "1" => 48,
          "10" => 36,
          "11" => 0,
          "12" => 0,
          "13" => 0,
          "14" => 0,
          "15" => 0,
          "16" => 0,
          "17" => 0,
          "18" => 0,
          "19" => 0,
          "2" => 45,
          "20" => 0,
          "21" => 0,
          "22" => 0,
          "23" => 0,
          "24" => 0,
          "25" => 0,
          "26" => 0,
          "27" => 0,
          "28" => 0,
          "29" => 0,
          "3" => 31,
          "30" => 0,
          "4" => 42,
          "5" => 49,
          "6" => 18,
          "7" => 27,
          "8" => 25,
          "9" => 24
        }
      }

      assert response == expect_response
    end
  end

  describe "fetch_higher_cost/2" do
    test "when the option is 'users', returns the user who spent the most" do
      file_name = "report_test.csv"

      response = ReportGenerator.build(file_name) |> ReportGenerator.fetch_higher_cost("users")

      expect_response = {:ok, {"5", 49}}

      assert response == expect_response
    end

    test "when the option is 'foods', return the food more chosen" do
      file_name = "report_test.csv"

      response = ReportGenerator.build(file_name) |> ReportGenerator.fetch_higher_cost("foods")

      expect_response = {:ok, {"esfirra", 3}}

      assert response == expect_response
    end

    test "when the option is invalid, return 'Invalid option'" do
      file_name = "report_test.csv"

      response = ReportGenerator.build(file_name) |> ReportGenerator.fetch_higher_cost("banana")

      expect_response = {:error, "Invalid option"}

      assert response == expect_response
    end
  end
end
