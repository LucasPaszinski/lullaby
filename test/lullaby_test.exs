defmodule LullabyTest do
  use ExUnit.Case
  doctest Lullaby

  test "greets the world" do
    assert Lullaby.hello() == :world
  end
end
