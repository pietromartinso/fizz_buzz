defmodule FizzBuzzTest do
  use ExUnit.Case
  doctest FizzBuzz

  test "greets the world" do
    assert FizzBuzz.hello() == :world
  end
end
