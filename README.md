Syts
====

Syts is a very basic command-line YouTube searcher.

It takes a query from the user, grabs (up to) 5 YouTube results, and then presents
them to the user for selection. The selected video is then played in MPV.

I wrote this to try out Elixir. It's probably not idiomatic or safe to use.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `syts` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:syts, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/syts](https://hexdocs.pm/syts).

