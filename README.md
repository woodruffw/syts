Syts
====

Syts is a very basic command-line YouTube searcher.

It takes a query from the user, grabs (up to) 5 YouTube results, and then presents
them to the user for selection. The selected video is then played in MPV.

I wrote this to try out Elixir. It's probably not idiomatic or safe to use.

## Installation

Syts is available via Hex:

```elixir
def deps do
  [
    {:syts, "~> 0.2.0"}
  ]
end
```

Documentation is available on [HexDocs](https://hexdocs.pm/syts/Syts.html).

