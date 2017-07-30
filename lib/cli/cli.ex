defmodule Syts.CLI do
  @moduledoc """
  This is the `Syts.CLI` module.

  `Syts.CLI` provides a (very) simple CLI interface to `Syts`.
  """

  @doc """
  Invoke `Syts.run/1` with a query string created out of the argument list provided.
  """
  @spec main([String.t()]) :: :ok
  def main(args) do
    query = Enum.join args

    case query do
      "" ->
        IO.puts "Usage: syts [query]"
        System.halt 0
      _ ->
        Syts.run query
    end
  end
end
