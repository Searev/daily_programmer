defmodule DailyProgrammerTest do
  use ExUnit.Case
  doctest DailyProgrammer

  test "greets the world" do
    assert DailyProgrammer.hello() == :world
  end
end
