defmodule ReportGeneratorTest do
  use ExUnit.Case
  doctest ReportGenerator

  test "greets the world" do
    assert ReportGenerator.hello() == :world
  end
end
