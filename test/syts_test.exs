defmodule SytsTest do
  use ExUnit.Case
  doctest Syts

  test "ensures dependencies are installed" do
    assert Syts.check_system_sanity!() == :ok
  end
end
